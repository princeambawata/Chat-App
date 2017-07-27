class DirectMessagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
  	@chat_user = User.find(params[:id])
    users = [current_user, User.find(params[:id])]
    @chatroom = Chatroom.direct_message_for_users(users)
    @messages = @chatroom.messages.order(created_at: :desc).limit(100).reverse
  end

  def message
  end
  	
end
