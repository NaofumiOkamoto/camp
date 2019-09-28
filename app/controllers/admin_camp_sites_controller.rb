class AdminCampSitesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @admin_camp_site = CampSite.new
  end

  def create
    @admin_camp_site = CampSite.new(camp_site_params)
    if @admin_camp_site.save
      redirect_to admin_camp_sites_path
    else
      render :new
    end
  end

  def index
    @search = CampSite.ransack(params[:q]) #検索オブジェクト
    @search_camp_sites = @search.result #検索結果
    @camp_sites = CampSite.all
    @prefectures = Prefecture.all
    @categories = Category.all
  end

  def show
    @admin_camp_site = CampSite.find(params[:id])
  end

  def edit
    @admin_camp_site = CampSite.find(params[:id])
  end

  def update
    @admin_camp_site = CampSite.find(params[:id])
    if @admin_camp_site.update(camp_site_params)
      redirect_to admin_camp_sites_path
      if params[:camp_site][:image_ids]
        params[:camp_site][:image_ids].each do |image_id|
          image = @admin_camp_site.camp_images.find(image_id)
          image.purge
        end
      end
    else
      render :edit
    end
  end

  def destroy
    admin_camp_site = CampSite.find(params[:id])
    if admin_camp_site.destroy
    flash[:danger] = "#{admin_camp_site.name}を削除しました"
    redirect_to admin_camp_sites_path
    else
      render :index
    end
  end



  private

  def camp_site_params
    params.require(:camp_site).permit(
    :name,
    :area_id,
    :prefecture_id,
    :address,
    :category_id,
    :introduction,
    :latitude,
    :longitude,
    camp_images: []
    )
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
