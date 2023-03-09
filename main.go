package main

import (
	"context"
	"fmt"
	"net"
	"os"
	"os/signal"

	"com.github/pantasystem/rpc-chat/pkg/impl"
	"com.github/pantasystem/rpc-chat/pkg/service"
	"com.github/pantasystem/rpc-chat/pkg/service/proto"
	grpc_middleware "github.com/grpc-ecosystem/go-grpc-middleware"
	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func main() {
	fmt.Printf("test")

	db, err := gorm.Open(sqlite.Open("test.db"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	core := impl.NewCore(db)
	core.AutoMigration()

	port := 8080
	listener, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil {
		panic(err)
	}
	s := grpc.NewServer(
		grpc.UnaryInterceptor(
			grpc_middleware.ChainUnaryServer(
				NewAuthInterceptor(core),
			),
		),
	)

	accountService := service.AccountService{
		Core: core,
	}
	proto.RegisterAccountServiceServer(s, &accountService)

	reflection.Register(s)

	go func() {
		fmt.Printf("start gRPC server port: %v", port)
		s.Serve(listener)
	}()

	// 4.Ctrl+Cが入力されたらGraceful shutdownされるようにする
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt)
	<-quit
	fmt.Println("stopping gRPC server...")
	s.GracefulStop()

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

	return context.WithValue(ctx, "userId", userId), nil
}

// func authenticate(ctx context.Context) (context.Context, error) {
// 	token, err := grpc_auth.AuthFromMD(ctx, "Bearer")

// 	return ctx, nil
// }

// protoc --go_out=./pkg/pb --go_opt=paths=source_relative \
//     --go-grpc_out=./pkg/pb --go-grpc_opt=paths=source_relative ./proto/account.proto

// protoc --go_out=./pkg/pb --go-grpc_out=./pkg/pb ./proto/account.proto

// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto

// 下記コマンドにて生成
// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto
