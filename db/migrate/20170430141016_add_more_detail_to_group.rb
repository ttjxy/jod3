class AddMoreDetailToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :description2, :text
  
  end
end
