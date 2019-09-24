# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  nickname               :string
#  prefecture_id          :integer
#  style_id               :integer
#  introduction           :text
#  check_in               :string           default("非チェックイン")
#  isdeleted              :boolean          default(FALSE)
#  provider               :string
#  uid                    :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
