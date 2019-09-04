# == Schema Information
#
# Table name: like_camps
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  camp_site_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LikeCamp < ApplicationRecord
  belongs_to :user
  belongs_to :camp_site
end
