class AddTimestampsToAdminships < ActiveRecord::Migration
  def change
    change_table(:adminships) { |t| t.timestamps }
  end
end
