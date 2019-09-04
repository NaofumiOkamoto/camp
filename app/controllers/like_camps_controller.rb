class LikeCampsController < ApplicationController
  before_action :set_variables

  def like_camp_site # remote: trueにより、like_camp_siteの名前のjs.erbファイルを呼び出す。
    like = current_user.like_camps.new(camp_site_id: @camp_site.id)
    flash.now[:success] = "#{@camp_site.name}をお気に入り登録しました。"
    like.save
  end
  def unlike_camp_site
    like = current_user.like_camps.find_by(camp_site_id: @camp_site.id)
    flash.now[:warning] = "#{@camp_site.name}をお気に入りを外しました。"
    like.destroy
  end

  private
  def set_variables
    @camp_site = CampSite.find(params[:camp_site_id])
    @id_name = "#like-camp-link-#{@camp_site.id}"
  end
end
