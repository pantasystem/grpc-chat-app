package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Account struct {
	Id        uuid.UUID `gorm:"primaryKey"`
	Name      string
	AvatarUrl *string `gorm:"default:null"`
	CreatedAt time.Time
	UpdatedAt time.Time
}

func NewAccount(name string) *Account {
	return &Account{
		Name: name,
	}
}

func (r *Account) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	r.Id = uuid
	return err
}
