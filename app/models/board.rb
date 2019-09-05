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

class Board < ApplicationRecord
  belongs_to :user
  belongs_to :camp_site
  has_many :like_boards

# Action Mailer（画像）
  has_one_attached :board_image

# 募集目的のアクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :purpos
  delegate :purpos_name, to: :purpos
end
