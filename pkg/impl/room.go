package impl

import (
	"context"
	"errors"

	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/repositories"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

// RoomRepositoryのImpl構造体
type RoomRepositoryImpl struct {
	C *Core
}

// Roomを取得する
func (r *RoomRepositoryImpl) Find(ctx context.Context, id uuid.UUID) (*models.Room, error) {
	var room models.Room
	if result := r.C.DB.First(&room, "id = ?", id); result.Error != nil {
		return nil, result.Error
	}
	return &room, nil
}

// Roomを作成する
func (r *RoomRepositoryImpl) Create(ctx context.Context, room *models.Room) (*models.Room, error) {
	if result := r.C.DB.Create(room); result.Error != nil {
		return nil, result.Error
	}
	return r.Find(ctx, room.Id)
}

func (r *RoomRepositoryImpl) Join(ctx context.Context, roomID, accountID uuid.UUID) (*models.Room, error) {
	// Roomを取得
	_, err := r.Find(ctx, roomID)
	if err != nil {
		return nil, err
	}

	// Memberレコードの有無を確認
	var member models.Member
	if result := r.C.DB.First(&member, "room_id = ? AND account_id = ?", roomID, accountID); result.Error != nil {
		// errがRecordNotFoundでなければエラー
		if !errors.Is(result.Error, gorm.ErrRecordNotFound) {
			return nil, result.Error
		}

		// Memberレコードがなければ作成
		member = models.Member{
			RoomId:    roomID,
			AccountId: accountID,
		}
		if result := r.C.DB.Create(&member); result.Error != nil {
			return nil, result.Error
		}
	}

	// Roomを取得
	return r.Find(ctx, roomID)
}

// RoomRepositoryを取得
func NewRoomRepository() repositories.RoomRepository {
	return &RoomRepositoryImpl{}
}
