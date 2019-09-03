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
#

class CampSite < ApplicationRecord
  validates :name, presence: true
  has_one_attached :camp_image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :prefecture_name, to: :prefecture
  delegate :area, to: :prefecture
  belongs_to_active_hash :category
  delegate :category_name, to: :category

end
