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
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# Action Mailer（画像）
  has_one_attached :user_image

# 都道府県のアクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :prefecture_name, to: :prefecture
  belongs_to_active_hash :style
  delegate :style_name, to: :style

end

