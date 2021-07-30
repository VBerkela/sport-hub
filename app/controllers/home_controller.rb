class HomeController < ApplicationController
  def index
    @articles = Article.all
    @articles_counter = @articles.count
  end
end
