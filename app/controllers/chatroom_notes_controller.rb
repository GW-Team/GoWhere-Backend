class ChatroomNotesController < ApplicationController
  before_action :find_chatroom, except: [:show, :destroy]
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @note = @chatroom.chatroom_notes.new
  end

  def create
    @note = @chatroom.chatroom_notes.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      @chatroom.chatroom_messages.create(message_type: 4, child: @note.id, user_id: current_user.id, content: @note.content[0..19])
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def edit
    authorize! :manage, @note
  end

  def update
    authorize! :manage, @note
    if @note.update(note_params)
      redirect_to note_path
    else
      render :edit
    end
  end

  def show
    if @note.nil?
      flash[:notice] = "該投稿已被刪除！"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    authorize! :manage, @note
    @note.destroy if @note
    redirect_to chatroom_notes_path(@chatroom)
  end

  private
  def find_chatroom
    @chatroom = Chatroom.includes(:chatroom_notes, chatroom_messages: :user).find_by(id: params[:chatroom_id])
  end

  def find_note
    @note = ChatroomNote.includes(:chatroom).find_by(id: params[:id])
    if @note
      @chatroom = @note.chatroom 
    end
  end

  def note_params
    params.require(:chatroom_note).permit(:content)
  end

end
