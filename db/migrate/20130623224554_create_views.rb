class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :user_id
      t.belongs_to :viewable, polymorphic: true
      t.integer :count, null: false, default: 0

      t.timestamps
    end

    add_index :views, :user_id
    add_index :views, :viewable_id
  end
end
