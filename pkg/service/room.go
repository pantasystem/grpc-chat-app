package service

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/impl"
	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/service/proto"
	"github.com/google/uuid"
)

type RoomService struct {
	Core *impl.Core
	proto.UnimplementedRoomServiceServer
}

// Createを実装する
func (r *RoomService) Create(ctx context.Context, req *proto.CreateRoomRequest) (*proto.Room, error) {
	accountId := ctx.Value("accountId").(string)
	// accountIdを元にAccountを取得する
	uuid, err := uuid.Parse(accountId)
	if err != nil {
		return nil, err
	}
	account, err := r.Core.NewAccountRepository().Find(ctx, uuid)
	if err != nil {
		return nil, err
	}

	room, err := r.Core.NewRoomRepository().Create(ctx, models.NewRoom(req.Name, account.Id))
	if err != nil {
		return nil, err
	}

	room, err = r.Core.NewRoomRepository().Join(ctx, room.Id, account.Id)
	if err != nil {
		return nil, err
	}

	return &proto.Room{
		Id:      room.Id.String(),
		Name:    room.Name,
		OwnerId: room.AccountId.String(),
	}, nil
}

func (r *RoomService) Find(ctx context.Context, req *proto.FindRoomRequest) (*proto.Room, error) {
	uuid, err := uuid.Parse(req.Id)
	if err != nil {
		return nil, err
	}
	room, err := r.Core.NewRoomRepository().Find(ctx, uuid)

	if err != nil {
		return nil, err
	}

	return &proto.Room{
		Id:      room.Id.String(),
		Name:    room.Name,
		OwnerId: room.AccountId.String(),
	}, nil
}

func (r *RoomService) FindRoomMembers(context.Context, *proto.FindRoomRequest) (*proto.FindRoomMembersResponse, error) {
	return nil, nil
}
func (r *RoomService) JoinRoom(context.Context, *proto.JoinRoomRequest) (*proto.Room, error) {
	return nil, nil
}

func NewRoomServiceServer(c *impl.Core) proto.RoomServiceServer {
	return &RoomService{Core: c}
}
