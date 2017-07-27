class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_#{message.chatroom.id}_channel",{
                                 message: render_message(message),
                                 chatroom_id: message.chatroom.id
                             }
  end

  private

  def render_message(message)
     ApplicationController.renderer.render(partial: 'direct_messages/message', locals: { message: message }) 
  end
end
