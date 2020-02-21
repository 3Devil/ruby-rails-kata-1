class AuthorController < ApplicationController
  def search
    email = params['email']
    @articles = Author.find_by(email: email)&.articles || []
  end
end
