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

require 'test_helper'

class BoardCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
