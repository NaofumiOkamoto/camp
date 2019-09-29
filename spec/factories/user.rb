FactoryBot.define do
  factory :user do
    name { "test" }
    nickname { "A" }
    email { "camp@camp" }
    prefecture_id { 13 }
    password { "000000" }
  end
end
