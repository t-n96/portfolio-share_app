class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :introduction
      t.string :post_image

      t.timestamps
    end
  end
end
