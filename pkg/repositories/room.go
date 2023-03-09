package repositories

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/models"
)

type RoomRepository interface {
	Create(ctx context.Context, room *models.Room) (*models.Room, error)
	Find(ctx context.Context, id string) (*models.Room, error)
}
