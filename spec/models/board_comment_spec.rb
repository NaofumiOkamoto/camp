require 'rails_helper'
RSpec.describe Board, type: :model do

    context "データが正しく保存される" do
        before do
            FactoryBot.create(:user)
            FactoryBot.create(:camp_site)
            FactoryBot.create(:board)
            @board_comment = BoardComment.new
            @board_comment.user_id = "1"
            @board_comment.board_id = "1"
            @board_comment.save
        end
        it "全て入力してあるので保存される" do
            expect(@board_comment).to be_valid
        end
    end
end
