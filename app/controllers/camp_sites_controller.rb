class CampSitesController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = CampSite.ransack(params[:q]) #検索オブジェクト
    @search_camp_count = @search.result
    @search_camp_sites = @search.result.page(params[:page]).per(6) #検索結果
    @camp_sites = CampSite.all
    @prefectures = Prefecture.all
    @categories = Category.all
  end
  def show
    @camp_site = CampSite.find(params[:camp_site_id])
    @boards = Board.where(camp_site_id: @camp_site.id)

    @messages = @camp_site.messages

    if cookies[:recent_camp_site_id].nil?
      cookies[:recent_camp_site_id] = @camp_site.id.to_s
    else
      cookies[:recent_camp_site_id] += "," + @camp_site.id.to_s
    end

  end
end
