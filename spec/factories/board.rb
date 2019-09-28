FactoryBot.define do
  factory :board, class: Board do
    user_id { 1 }
    date { "2019/10/10" }
    time { "10:01" }
    place { "ああああ" }
    purpos_id { 1 }
    detail { "ああああ" }
    condition { "ああああ" }
    camp_site_id { 1 }
  end
end
