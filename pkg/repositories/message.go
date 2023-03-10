package repositories

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"github.com/google/uuid"
)

type MessageRepository interface {
	// Messageを保存する
	Create(ctx context.Context, message *models.Message) (*models.Message, error)
	// Messageを取得する
	Find(ctx context.Context, id uuid.UUID) (*models.Message, error)

	// Roomに紐づくMessageを取得する
	FindAllByRoom(ctx context.Context, roomID uuid.UUID) ([]*models.Message, error)
	// Accountに紐づくMessageを取得する
	FindAllByAccount(ctx context.Context, accountID uuid.UUID) ([]*models.Message, error)

	// Roomに紐づくMessageをchannelで取得する
	ObserveByRoom(ctx context.Context, roomID uuid.UUID) (<-chan *models.Message, error)
}
