class AddTimestampsToMemberships < ActiveRecord::Migration
  def change
    change_table(:memberships) { |t| t.timestamps }
  end
end
