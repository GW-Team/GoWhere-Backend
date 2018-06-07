class ChatroomPhotosController < ApplicationController
  before_action :find_chatroom, only: [:create]

  def create
    @photo = @chatroom.chatroom_photos.new(photo_param)
    if @photo.save
      message = "上傳成功"
      @chatroom.chatroom_messages.create(message_type: 2, child: @photo.id, user_id: current_user.id)
    else
      message = "檔案格式不符合，請再次確認後再上傳"
    end
    redirect_to chatroom_path(@chatroom), notice: message
  end

  def destroy
  end

  private
  def find_chatroom
    @chatroom = Chatroom.find_by(id: params[:chatroom_id])
  end

  def photo_param
    params.require(:chatroom_photo).permit(:path)
  end
end
