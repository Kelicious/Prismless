class AddPrivacyToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :privacy, :string
    add_column :communities, :password_digest, :string
  end
end
