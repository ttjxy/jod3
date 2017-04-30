class AddMoreDetailToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :Objective, :text
    add_column :posts, :Reflective, :text
    add_column :posts, :Interpretive, :text
    add_column :posts, :Decisional, :text
    delete_column :posts, :Objective, :text
    delete_column :posts, :Reflective, :text
    delete_column :posts, :Interpretive, :text
    delete_column :posts, :Decisional, :text
  end
end
