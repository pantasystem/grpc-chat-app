package impl

import (
	"context"
	"fmt"
	"sync"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
	"github.com/google/uuid"
	"gorm.io/gorm/clause"
)

var (
	observer = MessageRepositoryObserver{}
)

// MessageRepositoryを実装する
type MessageRepositoryImpl struct {
	C        *Core
	Observer *MessageRepositoryObserver
}

// Messageを保存する
func (r *MessageRepositoryImpl) Create(ctx context.Context, message *models.Message) (*models.Message, error) {
	// Messageを作成
	if result := r.C.DB.Preload(clause.Associations).Create(message); result.Error != nil {
		return nil, result.Error
	}

	message, err := r.Find(ctx, message.Id)
	if err != nil {
		return nil, err
	}

	go r.Observer.Send(message)

	return message, err
}

// Messageを取得する
func (r *MessageRepositoryImpl) Find(ctx context.Context, id uuid.UUID) (*models.Message, error) {
	// gormからMessageを取得
	var message models.Message
	if result := r.C.DB.Preload(clause.Associations).First(&message, "id = ?", id); result.Error != nil {
		return nil, result.Error
	}

	return &message, nil
}

// Roomに紐づくMessageを取得する
func (r *MessageRepositoryImpl) FindAllByRoom(ctx context.Context, roomID uuid.UUID) ([]*models.Message, error) {
	// gormからMessageを取得
	var messages []*models.Message
	if result := r.C.DB.Preload(clause.Associations).Find(&messages, "room_id = ?", roomID); result.Error != nil {
		return nil, result.Error
	}
	return messages, nil
}

// Accountに紐づくMessageを取得する
func (r *MessageRepositoryImpl) FindAllByAccount(ctx context.Context, accountID uuid.UUID) ([]*models.Message, error) {
	// gormからMessageを取得
	var messages []*models.Message
	if result := r.C.DB.Preload(clause.Associations).Find(&messages, "account_id = ?", accountID); result.Error != nil {
		return nil, result.Error
	}
	return messages, nil
}

func (r *MessageRepositoryImpl) ObserveByRoom(ctx context.Context, roomID uuid.UUID) (<-chan *models.Message, error) {
	// channelを作成する
	channel := make(chan *models.Message)

	// channelを追加する
	r.Observer.AddChannel(channel)

	// ctxがキャンセルされたらchannelを閉じた上で削除する
	go func() {
		<-ctx.Done()
		close(channel)
	}()

	return channel, nil
}

// channelとMutexを構造体で管理する
type MessageRepositoryObserver struct {
	// 配列でチャンネルを管理する
	Channels []chan *models.Message

	// Mutex
	Mutex sync.Mutex
}

// MessageRepositoryObserverにMessageを送信する
func (o *MessageRepositoryObserver) Send(message *models.Message) {
	// Mutexをロックする
	o.Mutex.Lock()

	// Channelsに送信する
	for _, channel := range o.Channels {
		// channelが閉じられていたら削除する
		if _, ok := <-channel; !ok {
			fmt.Printf("Skip channel")
			continue
		}
		fmt.Printf("Send message: %v", message)

		channel <- message
	}

	// Mutexをアンロックする
	o.Mutex.Unlock()
}

// MessageRepositoryObserverにChannelを追加する
func (o *MessageRepositoryObserver) AddChannel(channel chan *models.Message) {
	// Mutexをロックする
	o.Mutex.Lock()
	// Channelsにchannelを追加する
	o.Channels = append(o.Channels, channel)
	// Mutexをアンロックする
	o.Mutex.Unlock()
}

func NewMessageRepository() repositories.MessageRepository {
	return &MessageRepositoryImpl{
		Observer: &observer,
	}
}
