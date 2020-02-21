class CreateArticleAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :article_authors do |t|
      t.integer :author_id
      t.integer :article_id

      t.timestamps
    end
  end
end
