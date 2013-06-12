class AddCategoryIdToForums < ActiveRecord::Migration
  def change
    add_column :forums, :category_id, :integer
    add_index :forums, :category_id
  end
end
