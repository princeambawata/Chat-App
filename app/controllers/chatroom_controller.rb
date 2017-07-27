class ChatroomController < ApplicationController
  before_action :authenticate_user!
  def index
    @chat_rooms = Chatroom.all
  end

  def new
  end

  def create
    @chat_room = current_user.chatrooms.build(title: params[:title])
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
  @chatroom = Chatroom.includes(:messages).find_by(id: params[:id])
  @message = Message.new
  end

end
