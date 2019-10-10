FactoryBot.define do
  factory :user do
    name { "test" }
    nickname { "A" }
    email { "camp@camp" }
    prefecture_id { 13 }
    password { "000000" }

    trait :user_image do
      after :create do |user|
        user.attached = fixture_file_upload(Rails.root.join('spec', 'files', 'images.jpeg'), 'image/jpeg')
      end
    end

  end
end
