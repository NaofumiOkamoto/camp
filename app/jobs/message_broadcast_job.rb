class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    user = User.find(message.user_id)
    ActionCable.server.broadcast "room_channel_#{message.camp_site_id}",
      message: render_message(message),
      content: message.content,
      user_id: message.user_id,
      message_id: message.id,
      nick_name: user.nickname,
      user_image: user.user_image,
      created_at: message.created_at.strftime("%Y年%m月%d日 %H:%M")
  end

  private
  def render_message(message)
    user = User.find(message.user_id)
    ApplicationController.render_with_signed_in_user user, partial: 'messages/message', locals: {message: message}
  end
end
