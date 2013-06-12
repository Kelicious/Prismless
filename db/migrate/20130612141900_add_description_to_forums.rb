class AddDescriptionToForums < ActiveRecord::Migration
  def change
    add_column :forums, :description, :string
  end
end
