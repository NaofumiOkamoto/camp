require 'rails_helper'
RSpec.describe UsersController, type: :controller do
      before do
        @user = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@camp')
      end
    describe 'マイページの表示' do
      before do
        sign_in @user
      end
      context "マイページが正しく表示される" do
        before do
          sign_in @user
          get :show, params: { id: @user.id }
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        before do
          sign_in @user
          get :show, params: { id: @user.id }
        end
          render_views
        it 'タイトルが正しく表示されていること' do
          expect(response.body).to include("マイページ")
        end
        it 'ユーザーニックネーム表示されていること' do
          expect(response.body).to include("#{@user.nickname}")
        end
      end
    end
    describe 'マイページ表示の詳細' do
      before do
        @camp_site = FactoryBot.create(:camp_site)
        @board = FactoryBot.create(:board, user_id: @user.id, camp_site_id: @camp_site.id)
        @like_camp = FactoryBot.create(:like_camp, user_id: @user.id, camp_site_id: @camp_site.id)
        @like_board = FactoryBot.create(:like_board, board_id: @board.id, user_id: @user.id)
        @post_board = @user.boards
        sign_in @user
        get :show, params: { id: @user.id }
      end
      context "編集ボタン" do
          render_views
        it '編集ボタンが表示される' do
          expect(response.body).to include("編集")
        end
      end
      context "お気に入りキャンプ場が表示される" do
          render_views
        it '画像が表示される' do
          expect(response.body).to include("#{@like_camp.camp_site.camp_images[0]}")
        end
      end
      context "お気に入りキャンプ場が表示される" do
          render_views
        it 'キャンプ場名が表示される' do
          expect(response.body).to include("#{@like_camp.camp_site.name}")
        end
      end
      context "お気に入り掲示板が表示される" do
          render_views
        it '掲示板,日にちが表示される' do
          expect(response.body).to include("#{@like_board.board.date}")
        end
        it '掲示板目的が表示される' do
          expect(response.body).to include("#{@like_board.board.purpos_name}")
        end
        it '掲示板依頼者ニックネームが表示される' do
          expect(response.body).to include("#{@like_board.user.nickname}")
        end
      end
      context "掲示板投稿履歴が表示される" do
          render_views
        it '掲示板,日にちが表示される' do
          expect(response.body).to include("#{@post_board[0].date}")
        end
        it '掲示板,日にちが表示される' do
          expect(response.body).to include("#{@post_board[0].user.nickname}")
        end
        it '掲示板,日にちが表示される' do
          expect(response.body).to include("#{@post_board[0].purpos_name}")
        end
      end
    end
end
