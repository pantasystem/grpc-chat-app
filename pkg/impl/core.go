package impl

import (
	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type Core struct {
	DB     *gorm.DB
	Pubsub *repositories.Pubsub
}

func NewCore(p *repositories.Pubsub) *Core {
	dsn := "host=psql user=dbuser password=secret dbname=database port=5432 sslmode=disable TimeZone=Asia/Tokyo"
	db, err := gorm.Open(postgres.Open(dsn))
	if err != nil {
		panic("failed to connect database")
	}
	return &Core{DB: db, Pubsub: p}
}

// AutoMigrationを実行する
func (c *Core) AutoMigration() {
	c.DB.AutoMigrate(
		&models.Account{},
		&models.Room{},
		&models.Message{},
		&models.Member{},
	)
}

// AccountRepositoryを生成する
func (c *Core) NewAccountRepository() repositories.AccountRepository {
	return &AccountRepositoryImpl{
		C: c,
	}
}

func (c *Core) NewRoomRepository() repositories.RoomRepository {
	return &RoomRepositoryImpl{
		C: c,
	}
}

func (c *Core) NewMessageRepository() repositories.MessageRepository {
	return &MessageRepositoryImpl{
		C:        c,
		Observer: &observer,
	}
}
