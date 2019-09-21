class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :recently
  before_action :recently_board
  before_action :ranking

  def set_search
    @search = CampSite.ransack(params[:q]) #検索オブジェクト
    @search_camp_sites = @search.result #検索結果
  end

  def self.render_with_signed_in_user(user, *args)
   ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
   proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
   renderer = self.renderer.new('warden' => proxy)
   renderer.render(*args)
  end


  def ranking
    @ranking_camp = CampSite.find(LikeCamp.group(:camp_site_id).order('count(camp_site_id) desc').pluck(:camp_site_id))
    @ranking_board = CampSite.find(Board.group(:camp_site_id).order('count(camp_site_id) desc').pluck(:camp_site_id))
  end


  protected

  def recently #キャンプ場 閲覧履歴
    if cookies[:recent_camp_site_id]
      @recently = cookies[:recent_camp_site_id].split(",").uniq.reverse
    end
  end
  def recently_board #掲示板 閲覧履歴
    if cookies[:recent_board_id]
      @recently_board = cookies[:recent_board_id].split(",").uniq.reverse
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :prefecture_id, :style_id, :introduction])
  end
end
