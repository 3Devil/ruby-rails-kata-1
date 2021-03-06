class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :isbn
      t.date :publishedAt
      t.string :type

      t.timestamps
    end
  end
end
