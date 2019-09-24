# == Schema Information
#
# Table name: boards
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  date         :date
#  time         :time
#  place        :string
#  purpos_id    :integer
#  detail       :string
#  condition    :string
#  comment      :string
#  camp_site_id :string
#  is_deleted   :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
