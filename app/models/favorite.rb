class Favorite < ActiveRecord::Base
  attr_accessible :community_id, :user_id

  belongs_to :user
  belongs_to :community

  validates :community_id, :user_id, presence: :true
  validates :user_id, uniqueness: {scope: [:community_id]}
end
