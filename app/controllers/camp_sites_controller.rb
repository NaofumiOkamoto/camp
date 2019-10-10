class CampSitesController < ApplicationController

  def index
    @search = CampSite.ransack(params[:q]) #検索オブジェクト
    @search_camp_count = @search.result #検索結果数のための変数
    @search_camp_sites = @search.result.page(params[:page]).per(6).includes(:camp_images_attachments).includes(:camp_images_blobs).includes(:like_camps).includes(:boards) #検索結果
    @camp_sites = CampSite.all
    @prefectures = Prefecture.all
    @categories = Category.all
  end
  def show
    @camp_site = CampSite.find(params[:camp_site_id])
    @boards = Board.where(camp_site_id: @camp_site.id).includes(user: :user_image_attachment).includes(user: :user_image_blob).includes(:user, :like_boards, :camp_site)
    @messages = @camp_site.messages.includes(user: :user_image_attachment).includes(user: :user_image_blob)

    #閲覧履歴
    if cookies[:recent_camp_site_id].nil?
       cookies[:recent_camp_site_id] = @camp_site.id.to_s
    else
       cookies[:recent_camp_site_id] += "," + @camp_site.id.to_s
    end

  end
end
