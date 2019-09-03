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
    @camp_sites = CampSite.all
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy
    admin_camp_site = CampSite.find(params[:id])
    admin_camp_site.destroy
    redirect_to admin_camp_sites_path

  end



  private

  def camp_site_params
    params.require(:camp_site).permit(
    :name,
    :area_id,
    :prefecture_id,
    :address,
    :category,
    :introduction
    )
  end
end
