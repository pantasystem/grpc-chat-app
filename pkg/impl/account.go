package impl

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
	"github.com/google/uuid"
)

// AccountRepositoryの実装
type AccountRepositoryImpl struct {
	C *Core
}

// Accountを作成
func (r *AccountRepositoryImpl) Create(ctx context.Context, account *models.Account) (*models.Account, error) {
	// gormにaccountを保存
	if result := r.C.DB.Create(account); result.Error != nil {
		return nil, result.Error
	}

	return r.Find(ctx, account.Id)
}

// Accountを取得
func (r *AccountRepositoryImpl) Find(ctx context.Context, id uuid.UUID) (*models.Account, error) {
	// gormからaccountを取得
	var account models.Account
	if result := r.C.DB.First(&account, "id = ?", id); result.Error != nil {
		return nil, result.Error
	}

	return &account, nil
}

// TokenからAccountを取得
func (r *AccountRepositoryImpl) FindByToken(ctx context.Context, token string) (*models.Account, error) {
	// gormからaccountを取得
	var account models.Account
	if result := r.C.DB.First(&account, "token = ?", token); result.Error != nil {
		return nil, result.Error
	}
	return &account, nil
}

func NewAccountRepository(c *Core) repositories.AccountRepository {
	return &AccountRepositoryImpl{
		C: c,
	}
}
