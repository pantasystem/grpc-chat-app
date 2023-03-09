package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Room struct {
	Id        uuid.UUID `gorm:"primaryKey"`
	Name      string
	AccountId uuid.UUID
	Account   Account `gorm:"foreignKey:AccountId;references:Id"`
	CreatedAt time.Time
	UpdatedAt time.Time
}

func NewRoom(name string, accountId uuid.UUID) *Room {
	return &Room{
		Name:      name,
		AccountId: accountId,
	}
}

func (r *Room) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	r.Id = uuid
	return err
}
