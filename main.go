package main

import (
	"fmt"
	"net"
	"os"
	"os/signal"

	"com.github/pantasystem/rpc-chat/pkg/service"
	"com.github/pantasystem/rpc-chat/pkg/service/proto"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	fmt.Printf("test")

	port := 8080
	listener, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil {
		panic(err)
	}

	s := grpc.NewServer()

	accountService := service.AccountService{}
	proto.RegisterAccountServiceServer(s, &accountService)

	reflection.Register(s)

	go func() {
		fmt.Printf("start gRPC server port: %v", port)
		s.Serve(listener)
	}()

	// 4.Ctrl+Cが入力されたらGraceful shutdownされるようにする
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt)
	<-quit
	fmt.Println("stopping gRPC server...")
	s.GracefulStop()

}

// protoc --go_out=./pkg/pb --go_opt=paths=source_relative \
//     --go-grpc_out=./pkg/pb --go-grpc_opt=paths=source_relative ./proto/account.proto

// protoc --go_out=./pkg/pb --go-grpc_out=./pkg/pb ./proto/account.proto

// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto

// 下記コマンドにて生成
// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto
