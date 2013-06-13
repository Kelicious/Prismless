class CreateAdminships < ActiveRecord::Migration
  def change
    create_table :adminships do |t|
      t.integer :community_id
      t.integer :user_id
    end

    add_index :adminships, :community_id
    add_index :adminships, :user_id
  end
end
