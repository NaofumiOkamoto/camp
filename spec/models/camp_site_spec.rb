require 'rails_helper'
RSpec.describe CampSite, type: :model do

    context "データが正しく保存される" do
        before do
            @camp_site = CampSite.new
            @camp_site.name = "Camp"
            @camp_site.prefecture_id = 1
            @camp_site.address = "渋谷"
            @camp_site.save
        end
        it "全て入力してあるので保存される" do
            expect(@camp_site).to be_valid
        end
    end
    context "データが正しく保存されない" do
        before do
            @camp_site = CampSite.new
            @camp_site.name = ""
            @camp_site.prefecture_id = 1
            @camp_site.address = ""
            @camp_site.save
        end
        it "addressが入力されていないので保存されない" do
            expect(@camp_site).to be_invalid
        end
        it "エラーメッセージが表示される" do
            expect(@camp_site.errors[:address]).to include("を入力してください")
            expect(@camp_site.errors[:name]).to include("を入力してください")
        end
    end
end
