require 'rails_helper'
RSpec.describe CampSitesController, type: :controller do
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
      context "キャンプ場詳細ページが正しく表示される" do
        before do
          FactoryBot.create(:camp_site)
          get :show, params: { camp_site_id: 1 }
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
end
