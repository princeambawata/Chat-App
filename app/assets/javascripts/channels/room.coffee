  jQuery(document).on 'turbolinks:load', ->

  App.global_chat = App.cable.subscriptions.create {
     channel: "RoomChannel"
     chatroom_id: $('#messages').data('chat-room-id')
    },
    connected: ->
     # Called when the subscription is ready for use on the server

    disconnected: ->
     # Called when the subscription has been terminated by the server

    received: (data) ->
      active_chatroom = $("[id = 'messages'][data-chat-room-id = '#{data.chatroom_id}']")
      active_chatroom.append(data['message'])
      messages_to_bottom = -> $('#messages').scrollTop($('#messages').prop("scrollHeight"))
      messages_to_bottom()
      
    speak:(message, chatroom_id) ->
     @perform 'speak', message: message,chatroom_id: chatroom_id

    $(document).ready ->
     $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.speak textarea.val(), $('#messages').data('chat-room-id')
        content = $('div.emoji-wysiwyg-editor.form-control')
        console.log(content)
      e.preventDefault()
      return false
