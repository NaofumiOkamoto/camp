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

require 'test_helper'

class LikeBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
