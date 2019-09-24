# == Schema Information
#
# Table name: camp_sites
#
#  id            :integer          not null, primary key
#  name          :string
#  area_id       :integer
#  prefecture_id :integer
#  address       :string
#  category_id   :integer
#  introduction  :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  latitude      :float
#  longitude     :float
#

require 'test_helper'

class CampSiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
