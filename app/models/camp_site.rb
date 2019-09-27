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

class CampSite < ApplicationRecord
  validates :name, :address, presence: true
  after_validation :geocode
  has_many :like_camps, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :messages, dependent: :destroy


# Action Mailer（画像）
  has_many_attached :camp_images, dependent: :destroy

# 地域、都道府県のアクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :prefecture_name, to: :prefecture
  delegate :area, to: :prefecture
  belongs_to_active_hash :category
  delegate :category_name, to: :category


  private
  def geocode # geocodingするAPIで経度緯度の情報を保存
      uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyCsCJhG5dejpV82VY5PzaZG84RRqwFs2Y0")
      res = HTTP.get(uri).to_s
      response = JSON.parse(res)
    if response.include?("OK")
      self.latitude = response["results"][0]["geometry"]["location"]["lat"]
      self.longitude = response["results"][0]["geometry"]["location"]["lng"]
    end
  end
end
