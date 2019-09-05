# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  name = "虎之助#{n+1}"
  email = "tora#{n+1}@tora"
  nickname = "とら#{n+1}"
  prefecture_id = "#{n+1}"
  style_id = "#{n+1}"
User.create!(name: name,
             email: email,
             password: "000000",
             nickname: nickname,
             prefecture_id: prefecture_id,
             style_id: style_id,
             introduction: "宜しくです",
             check_in: "非チェックイン",
            )
  @user = User.find_by(id: "#{n+1}")
  @user.user_image.attach(io: File.open("#{Rails.root}/db/fixtures/rantan.jpeg"), filename: "rantan.jpeg")
end


20.times do |n|
  name = "オートキャンプ場#{n+1}"
  area_id = "#{n+1}"
  prefecture_id = "#{n+1}"
  category_id = "#{rand(1..4)}"
CampSite.create!(name: name,
             area_id: area_id,
             prefecture_id: prefecture_id,
             category_id: category_id,
             introduction: "良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です良いキャンプ場です",
             address: "東京都渋谷区神南1丁目19-11"
            )
  @camp_site = CampSite.find_by(id: "#{n+1}")
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
end
CampSite.create!(name: "ふもとっぱらキャンプ場",
             area_id: 22,
             prefecture_id: 22,
             category_id: 1,
             introduction: "富士山の麓にある広いキャンプ場です",
             address: "静岡県富士宮市麓156"
            )
  @camp_site = CampSite.find_by(id: 21)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "森のまきばオートキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "千葉県にある広いキャンプ場です",
             address: "千葉県袖ヶ浦市林562-1-3"
            )
  @camp_site = CampSite.find_by(id: 22)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")

