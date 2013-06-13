class Adminship < ActiveRecord::Base
  attr_accessible :community_id, :user_id

  belongs_to :community
  belongs_to :user

  validates :community_id, :user_id, presence: true
end
