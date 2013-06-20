class AddPinnedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :pinned, :boolean, null: false, default: false
  end
end
