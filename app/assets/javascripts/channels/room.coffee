document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", camp_site_id: $('#messages').data('camp_site_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log('received')
      console.log(data)
      console.log(data.user_image)
      $('#messages').prepend data['message']
      if data['user_id'] != $('#messages').data('user_id')
        $('#message-' + data['message_id']).addClass('chat-message-right')
        imgHTML = $("#nickname-" + data['message_id']).find("img").prop('outerHTML')
        $('#nickname-' + data['message_id']).remove()
        #$('#content-' + data['message_id']).append('<span id="nickname-"' + String(data['message_id']) + ' >' + data['created_at'] + '<span class="chat-message-comment">' + data['content'] + '</span>' + 'image_tag(url_for' + data['user_image'] + ')' + data['nick_name'] + '</span>')
        $('#content-' + data['message_id']).append('<span id="nickname-"' + String(data['message_id']) + ' >' + data['created_at'] + '<span class="chat-message-comment">' + data['content'] + '</span>' + imgHTML + data['nick_name'] + '</span>')


    speak: (message) ->
      console.log('cooffeespeak')
      console.log(message)
      @perform 'speak', message: message


#  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
#      if event.keyCode is 13 # return = send
#        App.room.speak event.target.value
#        event.target.value = ''
#        event.preventDefault()
