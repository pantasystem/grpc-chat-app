package service

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/impl"
	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/service/proto"
	"github.com/google/uuid"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
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

func (r *RoomService) FindRoomMembers(ctx context.Context, req *proto.FindRoomRequest) (*proto.FindRoomMembersResponse, error) {
	// uuidにparseする
	uuid, err := uuid.Parse(req.Id)
	if err != nil {
		return nil, err
	}
	members, err := r.Core.NewRoomRepository().FindRoomMembers(ctx, uuid)
	if err != nil {
		return nil, err
	}
	// membersをproto.Accountに変換する
	accounts := make([]*proto.Account, len(members))
	for i, member := range members {
		accounts[i] = &proto.Account{
			Id:        member.Id.String(),
			Name:      member.Name,
			AvatarUrl: *member.AvatarUrl,
		}
	}
	return &proto.FindRoomMembersResponse{
		Account: accounts,
	}, nil

}
func (r *RoomService) JoinRoom(ctx context.Context, req *proto.JoinRoomRequest) (*proto.Room, error) {
	accountId := ctx.Value("accountId").(string)
	// accountIdを元にAccountを取得する
	accountUuid, err := uuid.Parse(accountId)
	if err != nil {
		return nil, err
	}
	account, err := r.Core.NewAccountRepository().Find(ctx, accountUuid)
	if err != nil {
		return nil, err
	}

	roomId, err := uuid.Parse(req.Id)
	if err != nil {
		return nil, err
	}

	room, err := r.Core.NewRoomRepository().Join(ctx, roomId, account.Id)
	if err != nil {
		return nil, err
	}
	// roomをproto.Roomに変換する
	return &proto.Room{
		Id:      room.Id.String(),
		Name:    room.Name,
		OwnerId: room.AccountId.String(),
	}, nil
}

func (r *RoomService) FindJoinedRooms(ctx context.Context, req *proto.FindJoinedRoomsRequest) (*proto.FindJoinedRoomsResponse, error) {
	accountId := ctx.Value("accountId").(string)
	// accountIdを元にAccountを取得する
	accountUuid, err := uuid.Parse(accountId)
	if err != nil {
		return nil, err
	}
	account, err := r.Core.NewAccountRepository().Find(ctx, accountUuid)
	if err != nil {
		return nil, err
	}

	rooms, err := r.Core.NewRoomRepository().FindJoinedRooms(ctx, account.Id)
	if err != nil {
		return nil, err
	}

	// roomsをproto.Roomに変換する
	protoRooms := make([]*proto.Room, len(rooms))
	for i, room := range rooms {
		protoRooms[i] = &proto.Room{
			Id:      room.Id.String(),
			Name:    room.Name,
			OwnerId: room.AccountId.String(),
		}
	}

	return &proto.FindJoinedRoomsResponse{
		Room: protoRooms,
	}, nil
}

func (r *RoomService) FindOwnedRooms(ctx context.Context, req *emptypb.Empty) (*proto.FindOwnedRoomsResponse, error) {
	accountId := ctx.Value("accountId").(string)
	// accountIdを元にAccountを取得する
	accountUuid, err := uuid.Parse(accountId)
	if err != nil {
		return nil, err
	}
	account, err := r.Core.NewAccountRepository().Find(ctx, accountUuid)
	if err != nil {
		return nil, err
	}

	rooms, err := r.Core.NewRoomRepository().FindOwnedRooms(ctx, account.Id)
	if err != nil {
		return nil, err
	}

	// roomsをproto.Roomに変換する
	protoRooms := make([]*proto.Room, len(rooms))
	for i, room := range rooms {
		protoRooms[i] = &proto.Room{
			Id:      room.Id.String(),
			Name:    room.Name,
			OwnerId: room.AccountId.String(),
		}
	}

	return &proto.FindOwnedRoomsResponse{
		Room: protoRooms,
	}, nil
}

func (r *RoomService) FindAllRooms(ctx context.Context, req *emptypb.Empty) (*proto.FindAllRoomsResponse, error) {
	rooms, err := r.Core.NewRoomRepository().FindAllRooms(ctx)
	if err != nil {
		return nil, err
	}

	// roomsをproto.Roomに変換する
	protoRooms := make([]*proto.Room, len(rooms))
	for i, room := range rooms {
		protoRooms[i] = &proto.Room{
			Id:      room.Id.String(),
			Name:    room.Name,
			OwnerId: room.AccountId.String(),
		}
	}

	return &proto.FindAllRoomsResponse{
		Room: protoRooms,
	}, nil
}

func NewRoomServiceServer(c *impl.Core) proto.RoomServiceServer {
	return &RoomService{Core: c}
}
