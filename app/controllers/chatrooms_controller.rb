class ChatroomsController < ApplicationController
  def show
    @user = current_user
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    if current_user.chatroom.nil?
      @chatroom = Chatroom.new(name: "Laundromate - #{current_user.id}", user: current_user)
      @chatroom.save!
    else
      @chatroom = current_user.chatroom
    end
    redirect_to "/chatrooms/#{@chatroom.id}"
  end

  def index
    @chatrooms = Chatroom.all
  end
end
