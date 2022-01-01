class PagesController < ApplicationController
  def home
    redirect_to articles_path if logged_in?
    
    @articles = Article.last(3)
  end

  def about; end
end
