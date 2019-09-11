class RoomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room_channel_#{params['camp_site_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
p
  def speak(data)
    #ActionCable.server.broadcast 'room_channel', message: data['message']
    p data
    Message.create!(content: data['message'], user_id: current_user.id, camp_site_id: params['camp_site_id'])
  end
end
