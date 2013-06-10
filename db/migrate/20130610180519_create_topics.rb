class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :forum_id
      t.integer :creator_id
      t.string :title

      t.timestamps
    end

    add_index :topics, :forum_id
    add_index :topics, :creator_id
  end
end
