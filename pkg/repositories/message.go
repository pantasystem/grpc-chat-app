package repositories

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/models"
)

type MessageRepository interface {
	// Messageを保存する
	Create(ctx context.Context, message *models.Message) (*models.Message, error)
	// Messageを取得する
	Find(ctx context.Context, id string) (*models.Message, error)

	// Roomに紐づくMessageを取得する
	FindAllByRoom(ctx context.Context, roomID string) ([]*models.Message, error)
	// Accountに紐づくMessageを取得する
	FindAllByAccount(ctx context.Context, accountID string) ([]*models.Message, error)
}