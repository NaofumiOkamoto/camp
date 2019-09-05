# == Schema Information
#
# Table name: like_boards
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LikeBoard < ApplicationRecord
  belongs_to :user
  belongs_to :board
end
