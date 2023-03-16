package queue

import (
	amqp "github.com/rabbitmq/amqp091-go"
)

type AMQP struct {
	Conn *amqp.Connection
	Ch   *amqp.Channel
}

func Setup() *AMQP {
	conn, err := amqp.Dial("amqp://root:password@rabbitmq:5672/")
	if err != nil {
		panic(err)
	}
	ch, err := conn.Channel()

	if err != nil {
		panic(err)
	}

	return &AMQP{
		Conn: conn,
		Ch:   ch,
	}

}

func (r *AMQP) Close() {
	r.Ch.Close()
	r.Conn.Close()
}
