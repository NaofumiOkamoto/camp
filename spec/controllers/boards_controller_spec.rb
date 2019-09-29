require 'rails_helper'
RSpec.describe BoardsController, type: :controller do
    describe '掲示板一覧ページ' do
      before do
        @user = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@camp')
        @camp_site = FactoryBot.create(:camp_site)
        @board = FactoryBot.create(:board, user_id: @user.id, camp_site_id: @camp_site.id)
        sign_in @user
          #fill_in 'メールアドレス', with: 'a@camp'
          #fill_in 'パスワード', with: '000000'
          #click_button 'ログイン'
          #binding.pry
      end
      context "掲示板一覧ページが正しく表示される" do
        before do
          get :index
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        render_views
        it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("掲示板一覧")
        end
      end
      context "掲示板詳細ページが正しく表示される" do
        before do
          get :show, params: { id: @board.id }
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        render_views
        it '掲示板情報が表示される' do
          expect(response.body).to include(@board.user.nickname)
          expect(response.body).to include(@board.purpos_name)
        end
      end
      context "掲示板が正しく削除される" do
        before do
        end
        it '掲示板削除' do
          expect{
            delete :destroy, params: { id: @board }
          }.to change(Board,:count).by(-1)
        end
      end
    end
end
