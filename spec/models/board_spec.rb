require 'rails_helper'
RSpec.describe Board, type: :model do

    context "データが正しく保存される" do
        before do
            FactoryBot.create(:camp_site)
            FactoryBot.create(:user)
            @board = Board.new
            @board.user_id = "1"
            @board.date = "2019/10/10"
            @board.time = "10:10"
            @board.place = "サイト"
            @board.purpos_id = 1
            @board.detail = "あああ"
            @board.condition = "あああ"
            @board.camp_site_id = "1"
            @board.save
        end
        it "全て入力してあるので保存される" do
            expect(@board).to be_valid
        end
    end
    context "データが正しく保存されない" do
        before do
            @board = Board.new
            @board.user_id = 1
            @board.date = ""
            @board.time = ""
            @board.place = ""
            @board.purpos_id = ""
            @board.detail = "あああ"
            @board.condition = "あああ"
            @board.camp_site_id = 1
            @board.save
        end
        it "addressが入力されていないので保存されない" do
            expect(@board).to be_invalid
        end
        it "エラーメッセージが表示される" do
            expect(@board.errors[:date]).to include("を入力してください")
            expect(@board.errors[:time]).to include("を入力してください")
            expect(@board.errors[:place]).to include("を入力してください")
            expect(@board.errors[:purpos_id]).to include("を入力してください")
        end
    end
end
