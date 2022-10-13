class AddKeyWordToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :keyword, :string
  end
end
