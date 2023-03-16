package queue

import (
	"encoding/json"

	"com.github/pantasystem/rpc-chat/pkg/models"
)

const (
	MessageCreatedEvent = "message.created"
	RoomCreatedEvent    = "room.created"
)

type Event struct {
	Type string `json:"type"`
	Body EventBody
}
type EventBody struct {
	Message *models.Message `json:"message"`
	Room    *models.Room    `json:"room"`
}

type AmqpEvent struct {
	Channel string
	Event   *Event
}

func OnMessageCreated(msg *models.Message) *Event {
	return &Event{
		Type: MessageCreatedEvent,
		Body: EventBody{
			Message: msg,
		},
	}
}

func OnRoomCreated(room *models.Room) Event {
	return Event{
		Type: RoomCreatedEvent,
		Body: EventBody{
			Room: room,
		},
	}
}

func (r *AmqpEvent) ToJsonBinary() ([]byte, error) {
	return json.Marshal(r)
}

func DecodeFromJsonBinary(data []byte) (*AmqpEvent, error) {
	var event AmqpEvent
	if err := json.Unmarshal(data, &event); err != nil {
		return nil, err
	}
	return &event, nil
}
