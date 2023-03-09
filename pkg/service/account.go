package service

import (
	"context"
	"fmt"

	"com.github/pantasystem/rpc-chat/pkg/service/proto"
	"github.com/google/uuid"
)

type AccountService struct {
	proto.UnimplementedAccountServiceServer
}

func (r *AccountService) CreateAccount(ctx context.Context, req *proto.CreateAccountRequest) (*proto.CreateAccountResponse, error) {
	return &proto.CreateAccountResponse{
		Token: uuid.NewString(),
		Account: &proto.Account{
			Id:        0,
			Name:      req.Name,
			AvatarUrl: req.AvatarUrl,
		},
	}, nil
}
func (r *AccountService) Find(ctx context.Context, req *proto.FindUser) (*proto.Account, error) {
	return nil, fmt.Errorf("Not Implemented")
}
