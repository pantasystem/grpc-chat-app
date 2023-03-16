package queue

import (
	"sync"

	"com.github/pantasystem/rpc-chat/pkg/models"
)

type Pubsub struct {
	mu     sync.RWMutex
	subs   map[string][]chan *models.Message
	closed bool
}

func NewPubsub() *Pubsub {
	return &Pubsub{
		subs: make(map[string][]chan *models.Message),
	}
}

func (p *Pubsub) Subscribe(topic string, channel chan *models.Message) {
	p.mu.Lock()
	defer p.mu.Unlock()

	p.subs[topic] = append(p.subs[topic], channel)
}

func (p *Pubsub) Publish(topic string, message *models.Message) {
	p.mu.RLock()
	defer p.mu.RUnlock()

	if p.closed {
		return
	}

	for _, channel := range p.subs[topic] {
		channel <- message
	}
}

// channelを削除する
func (p *Pubsub) Unsubscribe(topic string, channel chan *models.Message) {
	p.mu.Lock()
	defer p.mu.Unlock()

	if p.closed {
		return
	}

	subs := p.subs[topic]
	for i, sub := range subs {
		if sub == channel {
			subs = append(subs[:i], subs[i+1:]...)
			break
		}
	}
	p.subs[topic] = subs
}

func (p *Pubsub) Close() {
	p.mu.Lock()
	defer p.mu.Unlock()

	if !p.closed {
		p.closed = true

		for _, subs := range p.subs {
			for _, ch := range subs {
				close(ch)
			}
		}
	}

}
