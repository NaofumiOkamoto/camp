FactoryBot.define do
  factory :like_camp, class: LikeCamp do
    user_id { 1 }
    camp_site_id { 1 }
  end
end
