package main

import (
	"fmt"
)

func main() {
	fmt.Printf("test")
}

// protoc --go_out=./pkg/pb --go_opt=paths=source_relative \
//     --go-grpc_out=./pkg/pb --go-grpc_opt=paths=source_relative ./proto/account.proto

// protoc --go_out=./pkg/pb --go-grpc_out=./pkg/pb ./proto/account.proto

// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto

// 下記コマンドにて生成
// protoc --go_out=./pkg/service --go_opt=paths=source_relative --go-grpc_out=./pkg/service --go-grpc_opt=paths=source_relative ./proto/account.proto
