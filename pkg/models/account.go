package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Account struct {
	Id        uuid.UUID `gorm:"primaryKey"`
	Name      string
	AvatarUrl *string   `gorm:"default:null"`
	Token     uuid.UUID `gorm:"uniqueIndex"`
	CreatedAt time.Time
	UpdatedAt time.Time
}

func NewAccount(name string, avatarUrl string) *Account {
	return &Account{
		Name:      name,
		AvatarUrl: &avatarUrl,
	}
}

func (r *Account) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	if err != nil {
		return err
	}
	r.Id = uuid
	r.Token = uuid
	return nil
}
