class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :community_id
      t.string :slug

      t.timestamps
    end

    add_index :categories, :slug, unique: true
    add_index :categories, :community_id
  end
end
