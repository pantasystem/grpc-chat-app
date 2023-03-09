package impl

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
	"github.com/google/uuid"
	"gorm.io/gorm/clause"
)

// MessageRepositoryを実装する
type MessageRepositoryImpl struct {
	C *Core
}

// Messageを保存する
func (r *MessageRepositoryImpl) Create(ctx context.Context, message *models.Message) (*models.Message, error) {
	// Messageを作成
	if result := r.C.DB.Preload(clause.Associations).Create(message); result.Error != nil {
		return nil, result.Error
	}
	return r.Find(ctx, message.Id)
}

// Messageを取得する
func (r *MessageRepositoryImpl) Find(ctx context.Context, id uuid.UUID) (*models.Message, error) {
	// gormからMessageを取得
	var message models.Message
	if result := r.C.DB.Preload(clause.Associations).First(&message, "id = ?", id); result.Error != nil {
		return nil, result.Error
	}

	return &message, nil
}

// Roomに紐づくMessageを取得する
func (r *MessageRepositoryImpl) FindAllByRoom(ctx context.Context, roomID uuid.UUID) ([]*models.Message, error) {
	// gormからMessageを取得
	var messages []*models.Message
	if result := r.C.DB.Preload(clause.Associations).Find(&messages, "room_id = ?", roomID); result.Error != nil {
		return nil, result.Error
	}
	return messages, nil
}

// Accountに紐づくMessageを取得する
func (r *MessageRepositoryImpl) FindAllByAccount(ctx context.Context, accountID uuid.UUID) ([]*models.Message, error) {
	// gormからMessageを取得
	var messages []*models.Message
	if result := r.C.DB.Preload(clause.Associations).Find(&messages, "account_id = ?", accountID); result.Error != nil {
		return nil, result.Error
	}
	return messages, nil
}

func NewMessageRepository() repositories.MessageRepository {
	return &MessageRepositoryImpl{}
}
