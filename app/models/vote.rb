class Vote < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :value

  belongs_to :post, inverse_of: :votes
  belongs_to :user

  validates :user_id, :post_id, :value, presence: true
  validates :user_id, uniqueness: {scope: [:post_id]}
end
