package impl

import (
	"context"
	"fmt"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
	"github.com/google/uuid"
)

// RoomRepositoryのImpl構造体
type RoomRepositoryImpl struct {
	C *Core
}

// Roomを取得する
func (r *RoomRepositoryImpl) Find(ctx context.Context, id uuid.UUID) (*models.Room, error) {
	var room models.Room
	if result := r.C.DB.First(&room, "id = ?", id); result.Error != nil {
		return nil, result.Error
	}
	return &room, nil
}

// Roomを作成する
func (r *RoomRepositoryImpl) Create(ctx context.Context, room *models.Room) (*models.Room, error) {
	if result := r.C.DB.Create(room); result.Error != nil {
		return nil, result.Error
	}
	return r.Find(ctx, room.Id)
}

func (r *RoomRepositoryImpl) Join(ctx context.Context, roomID, accountID uuid.UUID) (*models.Room, error) {
	return nil, fmt.Errorf("Not Implemented")
}

// RoomRepositoryを取得
func NewRoomRepository() repositories.RoomRepository {
	return &RoomRepositoryImpl{}
}
