package impl

import (
	"context"
	"fmt"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
)

// MessageRepositoryを実装する
type MessageRepositoryImpl struct {
	C *Core
}

// Messageを保存する
func (r *MessageRepositoryImpl) Create(ctx context.Context, message *models.Message) (*models.Message, error) {
	return nil, fmt.Errorf("Not Implemented")
}

// Messageを取得する
func (r *MessageRepositoryImpl) Find(ctx context.Context, id string) (*models.Message, error) {
	return nil, fmt.Errorf("Not Implemented")
}

// Roomに紐づくMessageを取得する
func (r *MessageRepositoryImpl) FindAllByRoom(ctx context.Context, roomID string) ([]*models.Message, error) {
	return nil, fmt.Errorf("Not Implemented")
}

// Accountに紐づくMessageを取得する
func (r *MessageRepositoryImpl) FindAllByAccount(ctx context.Context, accountID string) ([]*models.Message, error) {
	return nil, fmt.Errorf("Not Implemented")
}

func NewMessageRepository() repositories.MessageRepository {
	return &MessageRepositoryImpl{}
}