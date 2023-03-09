package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Room struct {
	Id        uuid.UUID `gorm:"primaryKey"`
	Name      string
	AccountId string
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (r *Room) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	r.Id = uuid
	return err
}
