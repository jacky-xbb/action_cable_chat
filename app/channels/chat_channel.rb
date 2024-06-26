class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # Message.create!(user: current_user, body: data['body'])
    ActionCable.server.broadcast('chat_channel', data)
  end
end
