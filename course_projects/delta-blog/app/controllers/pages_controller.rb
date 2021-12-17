class PagesController < ApplicationController
  def home
    @articles = Article.last(3)
  end

  def about; end
end
