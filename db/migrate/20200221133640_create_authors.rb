class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :email
      t.string :firstName
      t.string :lastName

      t.timestamps
    end
  end
end
