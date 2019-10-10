class LikeCampsController < ApplicationController
  before_action :set_variables

  def like_camp_site # remote: trueにより、like_camp_siteの名前のjs.erbファイルを呼び出す。
    like = current_user.like_camps.new(camp_site_id: @camp_site.id)
    like.save
  end

  def unlike_camp_site
    like = current_user.like_camps.find_by(camp_site_id: @camp_site.id)
    like.destroy
  end

  private

  # js.erbで使用
  def set_variables
    @camp_site = CampSite.find(params[:camp_site_id])
    @id_name = "#like-camp-link-#{@camp_site.id}"
  end
end
