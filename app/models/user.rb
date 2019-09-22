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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #validates :name, :nickname, :prefecture_id, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.form_omniauth(auth) #snsログイン用
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
  has_many :like_camps
  has_many :like_boards
  has_many :boards
  has_many :messages

  #フォロー
  has_many :active_relationships, class_name: "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  #フォロワー
  has_many :passive_relationships, class_name: "Relationship",
            foreign_key: "followed_id",
            dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  #ユーザーフォロー
  def follow(other_user)
    following << other_user
  end
  #ユーザーフォロー解除
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  #現在のユーザーがフォローしてたらtureを返す
  def following?(other_user)
    following.include?(other_user)
  end


# Action Mailer（画像）
  has_one_attached :user_image

# 都道府県のアクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :prefecture_name, to: :prefecture
  belongs_to_active_hash :style
  delegate :style_name, to: :style

end

