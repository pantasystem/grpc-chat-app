package repositories

import (
	"context"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"github.com/google/uuid"
)

type AccountRepository interface {
	Create(ctx context.Context, account *models.Account) (*models.Account, error)
	Find(ctx context.Context, id uuid.UUID) (*models.Account, error)
	FindByToken(ctx context.Context, token string) (*models.Account, error)
}
