class HomeController < ApplicationController
  def index
    @articles = Article.last(5)
    @articles_counter = @articles.count
  end
end