class AdminCampSitesController < ApplicationController
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
    else
      render :edit
    end
  end

  def destroy
    admin_camp_site = CampSite.find(params[:id])
    admin_camp_site.destroy
    flash[:danger] = "#{admin_camp_site.name}を削除しました"
    redirect_to admin_camp_sites_path

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
    :camp_image
    )
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
