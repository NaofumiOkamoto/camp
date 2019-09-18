document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", camp_site_id: $('#messages').data('camp_site_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      #alert data['message']
      console.log('rec')
      console.log(data)
      $('#messages').prepend data['message']
      if data['user_id'] != $('#messages').data('user_id')
        $('#message-' + data['message_id']).addClass('chat-message-right')
        $('#nickname-' + data['message_id']).remove()
        $('#content-' + data['message_id']).append('<span id="nickname-"' + String(data['message_id']) + ' >' + data['nick_name'] + '</span>')


    speak: (message) ->
      console.log('speak')
      console.log(message)
      @perform 'speak', message: message


#  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
#      if event.keyCode is 13 # return = send
#        App.room.speak event.target.value
#        event.target.value = ''
#        event.preventDefault()
