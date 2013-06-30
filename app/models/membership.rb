class Membership < ActiveRecord::Base
  attr_accessible :community_id, :user_id

  belongs_to :community
  belongs_to :user

  validates :user_id, :community_id, presence: true
  validates :user_id, uniqueness: {scope: [:community_id]}
end
