package models

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Message struct {
	Id        uuid.UUID `gorm:"type:uuid;primary_key;"`
	Text      string    `gorm:"type:varchar(255);not null;"`
	AccountId uuid.UUID `gorm:"type:uuid;not null;"`
	Account   Account   `gorm:"foreignKey:AccountId;references:Id;"`
	RoomId    uuid.UUID `gorm:"type:uuid;not null;"`
	Room      Room      `gorm:"foreignKey:RoomId;references:Id;"`
	CreatedAt time.Time
	UpdatedAt time.Time
}

// Text, AccountId, RoomIdを元にAccountを生成する
func NewMessage(text string, accountId uuid.UUID, roomId uuid.UUID) *Message {
	return &Message{
		Text:      text,
		AccountId: accountId,
		RoomId:    roomId,
	}
}

func (r *Message) BeforeCreate(tx *gorm.DB) (err error) {
	uuid, err := uuid.NewRandom()
	r.Id = uuid
	return err
}
