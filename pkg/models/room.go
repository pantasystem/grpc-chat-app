package models

import "time"

type Room struct {
	Id        int64
	Name      string
	OwnerId   int64
	CreatedAt time.Time
	UpdatedAt time.Time
}
