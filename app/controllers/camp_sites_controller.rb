class CampSitesController < ApplicationController

  def index
    @search = CampSite.ransack(params[:q]) #検索オブジェクト
    @search_camp_sites = @search.result #検索結果
  end
  def show
    @camp_site = CampSite.find(params[:id])
    @boards = Board.where(camp_site_id: @camp_site.id)
  end
end
