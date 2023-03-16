package main

import (
	"fmt"
	"net"
	"os"
	"os/signal"

	"com.github/pantasystem/rpc-chat/pkg/impl"
	"com.github/pantasystem/rpc-chat/pkg/queue"
	"com.github/pantasystem/rpc-chat/pkg/service"
)

func main() {
	fmt.Printf("test")

	p := queue.NewPubsub()
	core := impl.NewCore(p)
	core.AutoMigration()

	port := 8080
	listener, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil {
		panic(err)
	}

	s := service.Setup(core)

	go func() {
		fmt.Printf("start gRPC server port: %v", port)
		s.Serve(listener)
	}()

	// 4.Ctrl+Cが入力されたらGraceful shutdownされるようにする
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt)
	<-quit
	fmt.Println("stopping gRPC server...")
	p.Close()
	s.GracefulStop()

}

// func authenticate(ctx context.Context) (context.Context, error) {
// 	token, err := grpc_auth.AuthFromMD(ctx, "Bearer")

// 	return ctx, nil
// }

// protoc --go_out=./pkg/pb --go_opt=paths=source_relative \
//     --go-grpc_out=./pkg/pb --go-grpc_opt=paths=source_relative ./proto/account.proto

// protoc --go_out=./pkg/pb --go-grpc_out=./pkg/pb ./proto/account.proto

// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto

// 下記コマンドにて生成
// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto
