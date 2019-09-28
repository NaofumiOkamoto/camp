FactoryBot.define do
  factory :camp_site, class: CampSite do
    name { "testcamp1" }
    address { "渋谷" }
    prefecture_id { 1 }
  end
end
