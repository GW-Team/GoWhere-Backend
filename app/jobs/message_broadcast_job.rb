class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms_#{message.chatroom.id}_channel", message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render partial: 'chatrooms/message', locals: {message: message}
  end
end
