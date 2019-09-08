# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  room_id    :integer
#

class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :room
  belongs_to :user
  after_create_commit { MessageBroadcastJob.perform_later self }
end
