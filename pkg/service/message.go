package service

import (
	"context"
	"fmt"

	"com.github/pantasystem/rpc-chat/pkg/impl"
	"com.github/pantasystem/rpc-chat/pkg/models"
	"com.github/pantasystem/rpc-chat/pkg/queue"
	"com.github/pantasystem/rpc-chat/pkg/service/proto"
	"github.com/google/uuid"
)

type MessageService struct {
	Core *impl.Core
	proto.UnimplementedMessageServiceServer
}

func (r *MessageService) CreateMessage(ctx context.Context, req *proto.CreateMessageRequest) (*proto.Message, error) {
	accountId, err := uuid.Parse(ctx.Value("accountId").(string))
	if err != nil {
		return nil, err
	}

	account, err := r.Core.NewAccountRepository().Find(ctx, accountId)
	if err != nil {
		return nil, err
	}

	roomId, err := uuid.Parse(req.RoomId)
	if err != nil {
		return nil, err
	}

	message, err := r.Core.NewMessageRepository().Create(ctx, models.NewMessage(req.Text, account.Id, roomId))
	if err != nil {
		return nil, err
	}
	// messageをproto.Messageに変換する
	return &proto.Message{
		Id:   message.Id.String(),
		Text: message.Text,
		Author: &proto.Account{
			Id:        message.AccountId.String(),
			Name:      message.Account.Name,
			AvatarUrl: *message.Account.AvatarUrl,
		},
	}, nil

}

func (r *MessageService) ObserveMessages(req *proto.ObserveMessageRequest, srv proto.MessageService_ObserveMessagesServer) error {
	roomId, err := uuid.Parse(req.RoomId)
	if err != nil {
		return err
	}
	// メッセージを受け取るchannelを作成する
	ch := make(chan *queue.Event)
	r.Core.Pubsub.Subscribe(roomId.String(), ch)

	// 切断を検知するためのcontextを作成する
	ctx := srv.Context()
	// 切断を検知するためのgoroutineを起動する
	go func() {
		<-ctx.Done()
		r.Core.Pubsub.Unsubscribe(roomId.String(), ch)
	}()

	fmt.Printf("ObserveMessages: %s\n", roomId.String())
	// chからメッセージを受け取り、proto.Messageに変換して送信する
	for event := range ch {
		message := event.Body.Message
		if message == nil {
			continue
		}
		fmt.Printf("received: %v\n", message)
		err := srv.Send(&proto.Message{
			Id:   message.Id.String(),
			Text: message.Text,
			Author: &proto.Account{
				Id:        message.AccountId.String(),
				Name:      message.Account.Name,
				AvatarUrl: *message.Account.AvatarUrl,
			},
		})
		if err != nil {
			fmt.Printf("error: %v\n", err)
			return err
		}
	}

	// channel, err := r.Core.NewMessageRepository().ObserveByRoom(srv.Context(), roomId)
	// if err != nil {
	// 	return err
	// }
	// // channelからメッセージを受け取り、proto.Messageに変換して送信する
	// for message := range channel {
	// 	err := srv.Send(&proto.Message{
	// 		Id:   message.Id.String(),
	// 		Text: message.Text,
	// 		Author: &proto.Account{
	// 			Id:        message.AccountId.String(),
	// 			Name:      message.Account.Name,
	// 			AvatarUrl: *message.Account.AvatarUrl,
	// 		},
	// 	})
	// 	if err != nil {
	// 		return err
	// 	}
	// }
	fmt.Printf("Close ObserveMessages: %s\n", roomId.String())
	return nil
}

func (r *MessageService) FindAllMessages(ctx context.Context, req *proto.FindAllMessagesRequest) (*proto.MessagesResponse, error) {
	roomId, err := uuid.Parse(req.RoomId)
	if err != nil {
		return nil, err
	}

	messages, err := r.Core.NewMessageRepository().FindAllByRoom(ctx, roomId)
	if err != nil {
		return nil, err
	}
	// messagesをproto.Messageに変換する
	var protoMessages []*proto.Message
	for _, message := range messages {
		protoMessages = append(protoMessages, &proto.Message{
			Id:   message.Id.String(),
			Text: message.Text,
			Author: &proto.Account{
				Id:        message.AccountId.String(),
				Name:      message.Account.Name,
				AvatarUrl: *message.Account.AvatarUrl,
			},
		})
	}
	return &proto.MessagesResponse{
		Messages: protoMessages,
	}, nil

}

func NewMessageServiceServer(c *impl.Core) proto.MessageServiceServer {
	return &MessageService{Core: c}
}
