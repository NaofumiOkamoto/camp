FactoryBot.define do
  factory :like_board, class: LikeBoard do
    board_id { 1 }
    user_id { 1 }
  end
end