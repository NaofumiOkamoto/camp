document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: $('#messages').data('room_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      #alert data['message']
      $('#messages').append data['message']
      # room_channel.rbでブロードキャストされたものがここに届く

    speak: (message) ->
      @perform 'speak', message: message
      #これが実行されるとコンシューマになったRoomChannelのspeakアクションが
      #引数'{message: mesage}'で実行される


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
      if event.keyCode is 13 # return = send
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()

