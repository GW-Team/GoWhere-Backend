class ChatroomNoteCommentsController < ApplicationController
  before_action :find_note

  def create
    @comment = @note.chatroom_note_comments.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.save
    redirect_to note_path(params[:note_id])
  end

  private
  def comment_params
    params.require(:chatroom_note_comment).permit(:content)
  end

  def find_note
    @note = ChatroomNote.includes(:chatroom_note_comments).find_by(id: params[:note_id])
  end
end
