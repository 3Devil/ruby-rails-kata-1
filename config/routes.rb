Rails.application.routes.draw do
  root 'article#list'

  get 'author/search'
  post 'author/search'
  get 'article/list'
  get 'article/search'
  post 'article/search'
end
