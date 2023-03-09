package impl

import (
	"context"
	"fmt"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
)

// RoomRepositoryのImpl構造体
type RoomRepositoryImpl struct {
}

// Roomを取得する
func (r *RoomRepositoryImpl) Find(ctx context.Context, id string) (*models.Room, error) {
	return nil, fmt.Errorf("Not Implemented")
}

// Roomを作成する
func (r *RoomRepositoryImpl) Create(ctx context.Context, room *models.Room) (*models.Room, error) {
	return nil, fmt.Errorf("Not Implemented")
}

// RoomRepositoryを取得
func NewRoomRepository() repositories.RoomRepository {
	return &RoomRepositoryImpl{}
}
