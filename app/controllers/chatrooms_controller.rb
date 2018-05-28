class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.includes(chatroom_messages: :user).find_by(id: params[:id])
  end
end
