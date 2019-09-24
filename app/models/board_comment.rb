# == Schema Information
#
# Table name: board_comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  user_id    :integer
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BoardComment < ApplicationRecord
  belongs_to :user
  belongs_to :board
end
