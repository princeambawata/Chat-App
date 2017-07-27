class RoomChannel < ApplicationCable::Channel
  def subscribed
  	chatrooms = Chatroom.all
  	chatrooms.each do |chatroom|
    stream_from "room_#{chatroom.id}_channel"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    current_user.messages.create!(body: data['message'], chatroom_id: data['chatroom_id'])
  end
end
