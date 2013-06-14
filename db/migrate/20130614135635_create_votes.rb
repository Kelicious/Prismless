class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :value
    end

    add_index :votes, :post_id
    add_index :votes, :user_id
    add_index :votes, [:post_id, :user_id], unique: true
  end
end
