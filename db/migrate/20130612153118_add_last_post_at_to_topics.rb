class AddLastPostAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :last_post_at, :datetime
    add_index :topics, :last_post_at
  end
end
