class ArticleController < ApplicationController
  def list
    @articles = Article.all
  end

  def search
    isbn = params['isbn']
    @articles = Article.where(isbn: isbn) || []
  end
end
