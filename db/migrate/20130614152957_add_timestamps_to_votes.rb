class AddTimestampsToVotes < ActiveRecord::Migration
  def change
    change_table(:votes) { |t| t.timestamps }
  end
end
