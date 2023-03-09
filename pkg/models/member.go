package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Member struct {
	Id        uuid.UUID `gorm:"type:uuid;primary_key"`
	RoomId    uuid.UUID `gorm:"type:uuid;not null;uniqueIndex:idx_room_account"`
	Room      Room      `gorm:"foreignKey:RoomId"`
	AccountId uuid.UUID `gorm:"type:uuid;not null;uniqueIndex:idx_room_account"`
	Account   Account   `gorm:"foreignKey:AccountId"`
	CreatedAt time.Time
	UpdatedAt time.Time
}

func (r *Member) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	r.Id = uuid
	return err
}
