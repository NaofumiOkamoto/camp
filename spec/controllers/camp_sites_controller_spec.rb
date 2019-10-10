require 'rails_helper'
RSpec.describe CampSitesController, type: :controller do
  describe 'キャンプ場コントローラー' do
    before do
      @camp_site = FactoryBot.create(:camp_site)
      @user = FactoryBot.create(:user)
    end
    describe 'キャンプ場一覧ページ' do
      context "キャンプ場一覧ページが正しく表示される" do
        before do
          get :index
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        render_views
        it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("キャンプ場一覧")
        end
      end
    end
    describe 'キャンプ場詳細ページ' do
      context "キャンプ場詳細情報が正しく表示される" do
        before do
          @like_camp = FactoryBot.create(:like_camp, user_id: @user.id, camp_site_id: @camp_site.id)
          get :show, params: { camp_site_id: 1 }
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        render_views
        it 'キャンプ場名が表示される' do
          expect(response.body).to include("#{@camp_site.name}")
        end
        render_views
        it 'キャンプ場住所が表示される' do
          expect(response.body).to include("#{@camp_site.address}")
        end
        render_views
        it 'キャンプ場住所が表示される' do
          expect(response.body).to include("#{@camp_site.category_name}")
        end
        it 'キャンプ場お気に入り数' do
          expect(response.body).to include("#{@camp_site.like_camps.count}")
        end
      end
    end
      context "キャンプ場掲示板が正しく表示される" do
        before do
          @user = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@camp')
          @board = FactoryBot.create(:board, user_id: @user.id, camp_site_id: @camp_site.id)
          get :show, params: { camp_site_id: 1 }
        end
        render_views
        it '掲示板日にちが表示される' do
          expect(response.body).to include("#{@board.date}")
        end
        render_views
        it '掲示板投稿者が表示される' do
          expect(response.body).to include("#{@board.user.nickname}")
        end
        it '掲示板目的が表示される' do
          expect(response.body).to include("#{@board.purpos_name}")
        end
      end
  end
end
