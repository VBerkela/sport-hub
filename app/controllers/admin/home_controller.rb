class Admin::HomeController < ApplicationController
  before_action :require_admin
  def index
    @articles = Article.last(5)
    @articles_counter = @articles.count
  end

  def require_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end