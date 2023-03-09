package impl

import (
	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
	"gorm.io/gorm"
)

type Core struct {
	DB *gorm.DB
}

func NewCore(db *gorm.DB) *Core {
	return &Core{DB: db}
}

// AutoMigrationを実行する
func (c *Core) AutoMigration() {
	c.DB.AutoMigrate(
		&models.Account{},
		&models.Room{},
		&models.Message{},
	)
}

// AccountRepositoryを生成する
func (c *Core) NewAccountRepository() repositories.AccountRepository {
	return &AccountRepositoryImpl{
		C: c,
	}
}
