class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :community_id
      t.integer :user_id
    end

    add_index :memberships, :community_id
    add_index :memberships, :user_id
  end
end
