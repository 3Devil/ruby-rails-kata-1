class Author < ApplicationRecord
  has_many :article_authors
  has_many :articles, through: :article_authors

  validates_presence_of :email
end
