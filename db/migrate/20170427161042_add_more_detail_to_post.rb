class AddMoreDetailToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :content2, :text
    add_column :posts, :content3, :text
  end
end
