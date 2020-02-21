class Article < ApplicationRecord
  has_many :article_authors
  has_many :authors, through: :article_authors

  validates_presence_of :isbn, :title

  default_scope { order(:title) }
end
