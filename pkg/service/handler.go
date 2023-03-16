package service

import (
	"context"
	"fmt"

	"com.github/pantasystem/rpc-chat/pkg/impl"
	"com.github/pantasystem/rpc-chat/pkg/service/proto"
	grpc_middleware "github.com/grpc-ecosystem/go-grpc-middleware"
	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func Setup(core *impl.Core) *grpc.Server {
	s := grpc.NewServer(
		grpc.UnaryInterceptor(
			grpc_middleware.ChainUnaryServer(
				NewAuthInterceptor(core),
			),
		),
	)

	accountService := AccountService{
		Core: core,
	}
	roomService := RoomService{
		Core: core,
	}
	messageService := MessageService{
		Core: core,
	}
	proto.RegisterAccountServiceServer(s, &accountService)
	proto.RegisterRoomServiceServer(s, &roomService)
	proto.RegisterMessageServiceServer(s, &messageService)

	reflection.Register(s)

	return s
}

func NewAuthInterceptor(c *impl.Core) func(ctx context.Context,
	req interface{},
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler,
) (interface{}, error) {
	return func(ctx context.Context,
		req interface{},
		info *grpc.UnaryServerInfo,
		handler grpc.UnaryHandler,
	) (interface{}, error) {
		fmt.Printf("info.FullMethod: %v\n", info.FullMethod)
		// 認証をスキップするパス
		if info.FullMethod == "/AccountService/CreateAccount" {
			return handler(ctx, req)
		} else {
			// 認証がOKならContextを返す
			userIdSetCtx, err := authorize(c, ctx)
			if err != nil {
				if info.FullMethod == "/AccountService/FindMe" {
					return handler(ctx, req)
				}
				return nil, err
			}
			return handler(userIdSetCtx, req)
		}
	}

}

func authorize(core *impl.Core, ctx context.Context) (context.Context, error) {
	// ヘッダーのトークンからユーザIDを取得
	token, err := grpc_auth.AuthFromMD(ctx, "Bearer")
	if err != nil {
		return nil, err
	}
	// jwtのトークンを検証してuserIdを取得（処理の記載は割愛）
	userId, err := core.NewAccountRepository().FindByToken(ctx, token)
	if err != nil {
		return nil, err
	}

	return context.WithValue(ctx, "accountId", userId.Id.String()), nil
}
