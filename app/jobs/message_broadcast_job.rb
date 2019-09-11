class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast "room_channel_#{message.camp_site_id}", message: render_message(message),user_id: message.user_id,message_id:message.id,nick_name:User.find(message.user_id).nickname
  end

  private
  def render_message(message)
    user = User.find(message.user_id)
    ApplicationController.render_with_signed_in_user user, partial: 'messages/message', locals: {message: message}
  end
end
