class ChatroomsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @chatroom = @user.chatrooms.create(chatroom_params)
    redirect_to user_chatroom_path(@user, @chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages.includes(:user)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
