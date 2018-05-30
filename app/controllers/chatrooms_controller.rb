class ChatroomsController < ApplicationController
  before_action :find_chatroom, only: [:edit, :update, :show]

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.is_group = true
    if @chatroom.save
      @chatroom.chatroom_groups.create(user_id: current_user.id, is_admin: true)
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chatroom.update(chatroom_params)
      redirect_to chatroom_path(@chatroom)
    else
      render :edit
    end
  end

  def show
  end
  
  private
  def find_chatroom
    @chatroom = Chatroom.includes(chatroom_messages: :user).find_by(id: params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :picture)
  end
end
