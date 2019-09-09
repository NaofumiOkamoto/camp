# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  camp_site_id :integer
#  user_id      :integer
#

class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :camp_site
  after_create_commit { MessageBroadcastJob.perform_later self }
end
