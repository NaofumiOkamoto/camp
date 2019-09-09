class CampSitesController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = CampSite.ransack(params[:q]) #検索オブジェクト
    @search_camp_sites = @search.result #検索結果
    @camp_sites = CampSite.all
  end
  def show
    @camp_site = CampSite.find(params[:camp_site_id])
    @boards = Board.where(camp_site_id: @camp_site.id)

    @messages = @camp_site.messages
  end
end
