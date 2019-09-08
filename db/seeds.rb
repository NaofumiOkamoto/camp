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


CampSite.create!(name: "ふもとっぱらキャンプ場",
             area_id: 22,
             prefecture_id: 22,
             category_id: 1,
             introduction: "富士山を眺めることのできる大草原、とても広大な芝生エリアが広がる場内、木々に囲まれたキャンプサイトなど開放的にすごしていただけます。 テントサイトのほか、貸し別荘のような宿泊施設もあり初心者の方やファミリーまで気軽に利用していただけます。 家族や友人と、のんびりとした時間を過ごしてみてはいかがでしょう。",
             address: "静岡県富士宮市麓156"
            )
  @camp_site = CampSite.find_by(id: 1)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "森のまきばオートキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "都心から1時間で大自然を満喫できる場所があります。 普段では見られない壮大の景色の中で、いつもと違う時間の流れに身を任せて、思い切りアウトドアを楽しみましょう！",
             address: "千葉県袖ヶ浦市林562-1-3"
            )
  @camp_site = CampSite.find_by(id: 2)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "柏しょうなんゆめファーム",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "柏しょうなんゆめファームは、自然との共生を目指してつくられたレジャー＆アドベンチャー施設です。
バーベキュー場は勿論、オートキャンプサイトやコテージなど宿泊施設も充実。自然の木立を利用したアスレチックやスケートボードパーク、バーベキュー場を完備し、大人も子供も1日中遊びながら心からリラックスしていただけます。",
             address: "千葉県柏市布瀬89-1"
            )
  @camp_site = CampSite.find_by(id: 3)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "南房総オレンジ村オートキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "高台にあるサイトは見晴らしが良く、心地良い風が吹き抜けます。オーナーがみかん園を経営しているのでみかん狩りも可！海まで5分のロケーションなので、釣りやサーフィン、海水浴などにも便利です。",
             address: "千葉県南房総市千倉町久保1494"
            )
  @camp_site = CampSite.find_by(id: 4)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "長瀞オートキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "花園インターから車で約20分、秩父鉄道・野上駅から徒歩約20分☆荒川を眺めることのできる、埼玉県長瀞町にある広大なファミリー向けのオートキャンプ場です",
             address: "埼玉県秩父郡長瀞町井戸559-1"
            )
  @camp_site = CampSite.find_by(id: 5)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "北軽井沢スウィートグラス",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "北軽井沢という最高のロケーションにあり、浅間山のスケールを感じられるこのキャンプ場は、キャンパーの人々が快適に、楽しく、そしていつまでも居たい、そんな環境が整っています。 グリーンスタイル(春季〜秋季)とホワイトスタイル（冬季）というコンセプトに分かれており、グリーンスタイルは往来のキャンプを、ホワイトスタイルは雪景色の中、いつもとは違うアウトドアライフを体験していただけます。 広い敷地内にはちびっ子たちがたのしめるアスレチックがたくさんあり、キャンプを楽しませるイベントも開催、また犬連れ用の施設もバッチリなので、ペット連れファミリーキャンパーの方におすすめです！",
             address: "群馬県吾妻郡長野原町北軽井沢1990-4448"
            )
  @camp_site = CampSite.find_by(id: 6)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "南アルプス三景園オートキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "南アルプスの山々を望む絶景のサイトでは、林間ならではの落ち着いた空間に清流のせせらぎが聞こえ、自然の中で思う存分にアウトドアを楽しんでいただけます。 地形を活かしたオートキャンプサイトや、バンガローが利用者のアウトドア体験を盛り上げてくれます。 故郷へ帰るような気持ちで利用していただきたいという管理人の心遣いが感じられる大自然に囲まれたキャンプ場で、思い思いの時間を過ごしてみてはいかがでしょうか。",
             address: "山梨県北杜市武川町柳沢烏帽子3601-1"
            )
  @camp_site = CampSite.find_by(id: 7)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "長瀞キャンプヴィレッジ",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "天然温泉もあり川遊びを楽しんだあともリフレッシュでき
ファミリーから団体様まで幅広くお楽しみ頂けます！",
             address: "埼玉県秩父郡長瀞町大字岩田483"
            )
  @camp_site = CampSite.find_by(id: 8)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "秩父巴川オートキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "荒川の河川敷に隣接したオートキャンプ場で、清流のせせらぎを聞きながらで川遊びや魚釣り、夜は川や星を見ながらのんびりバーベキューなど大自然の中ならではのアウトドアライフを思う存分楽しんでいただけます！ 自然の中でご家族や友人とご一緒に、日常にない開放感をたっぷり満喫していただけます。 平日限定でキャンプ場貸し切ることもできるので団体さんにもお勧めです。",
             address: "埼玉県秩父市下影森2222−4"
            )
  @camp_site = CampSite.find_by(id: 9)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "青野原オートキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "都心からアクセスの良い、豊かな水と緑に囲まれたキャンプ場です。 綺麗に澄んだ道志川では川遊びを満喫できます。 キャンプやバーベキューを始め、アユ釣り、マスのつかみ取りなどを楽しむことが可能です。 春夏秋冬、四季折々の自然の姿を楽しめるキャンプ場で思い思いのアウトドア体験をして過ごしてみてはいかがでしょう。",
             address: "神奈川県相模原市緑区青野原918−1"
            )
  @camp_site = CampSite.find_by(id: 10)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "浩庵キャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "1000円札のモデルになった景色が見えます。本栖湖の湖畔にあります。テントサイトは湖畔エリアと林間エリアの2種を用意しニーズに応えます。キッチン付キャビンも快適です。",
             address: "山梨県南巨摩郡身延町中ノ倉2926"
            )
  @camp_site = CampSite.find_by(id: 11)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "フォンテーヌの森つくばキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "茨城の静かな場所にあります。",
             address: "茨城県つくば市吉瀬1247-1"
            )
  @camp_site = CampSite.find_by(id: 12)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "青野原野呂ロッジキャンプ場",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "川辺でもテントを設営でき、ワイルドなキャンプができます。",
             address: "神奈川県相模原市緑区青野原931"
            )
  @camp_site = CampSite.find_by(id: 13)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "Lake Lodge YAMANAKA",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "富士五湖最大面積の山中湖にも１０秒で出れます！そこから富士山も眺められるので、自然の壮大さを改めて感じることができるのでは無いでしょうか。
また、当施設の売りは、「星」「木々」「夕陽」「山中湖」「富士山」です。
たくさんの木々に覆われている為、ほかの山中湖の夜景ポイントよりも村の明かりがなく、星が鮮明に見えます。
湖畔沿いに出れば、山中湖と富士山と夕陽が見れます。

サイト内は、大木に囲まれており、木々の間から差し込む太陽の日がキャンプを更に楽しい時間にしてくれます。
サイト一つ一つも少し大きめで設定されており、よりくつろげること間違いなし！",
             address: "山梨県南都留郡山中湖村平野479"
            )
  @camp_site = CampSite.find_by(id: 14)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "Lake Lodge YAMANAKA",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "富士五湖最大面積の山中湖にも１０秒で出れます！そこから富士山も眺められるので、自然の壮大さを改めて感じることができるのでは無いでしょうか。
また、当施設の売りは、「星」「木々」「夕陽」「山中湖」「富士山」です。
たくさんの木々に覆われている為、ほかの山中湖の夜景ポイントよりも村の明かりがなく、星が鮮明に見えます。
湖畔沿いに出れば、山中湖と富士山と夕陽が見れます。

サイト内は、大木に囲まれており、木々の間から差し込む太陽の日がキャンプを更に楽しい時間にしてくれます。
サイト一つ一つも少し大きめで設定されており、よりくつろげること間違いなし！",
             address: "千葉県香取市西田部738"
            )
  @camp_site = CampSite.find_by(id: 15)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
CampSite.create!(name: "DMM WEB CAMP",
             area_id: 12,
             prefecture_id: 12,
             category_id: 1,
             introduction: "キャンプ場と見せかけてプログラミングスクールです",
             address: "東京都渋谷区神南1丁目19-11"
            )
  @camp_site = CampSite.find_by(id: 16)
  @camp_site.camp_image.attach(io: File.open("#{Rails.root}/db/fixtures/camp1.jpg"), filename: "camp.jpg")
