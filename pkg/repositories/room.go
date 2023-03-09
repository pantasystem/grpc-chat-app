package repositories

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"github.com/google/uuid"
)

type RoomRepository interface {
	Create(ctx context.Context, room *models.Room) (*models.Room, error)
	Find(ctx context.Context, id uuid.UUID) (*models.Room, error)
	Join(ctx context.Context, roomID, accountID uuid.UUID) (*models.Room, error)
	FindRoomMembers(ctx context.Context, roomID uuid.UUID) ([]*models.Account, error)
}
