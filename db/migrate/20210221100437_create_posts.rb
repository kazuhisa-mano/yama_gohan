class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :name
      t.integer :image_id
      t.text :material
      t.text :recipe
      t.integer :cooking_time

      t.timestamps
    end
  end
end
