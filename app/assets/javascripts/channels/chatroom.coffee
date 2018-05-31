$(document).ready ->
  messages = $('#messages')

  if messages.length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
    messages_to_bottom()

    App.chatroom = App.cable.subscriptions.create {
        channel: "ChatroomChannel"
        chatroom_id: messages.data('chatroom-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      chat: (message, chatroom_id, type, user)->
        @perform 'chat', message: message, chatroom_id: chatroom_id, message_type: type, user: user

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 0
        App.chatroom.chat textarea.val(), messages.data('chatroom-id'), 1, messages.attr('user')
        textarea.val('')
      e.preventDefault()
      return false