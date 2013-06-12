class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :communities, :slug, unique: true
  end
end
