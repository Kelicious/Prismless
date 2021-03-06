class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :community_id
  
  belongs_to :community, inverse_of: :categories
  has_many :forums, inverse_of: :category, dependent: :destroy

  delegate :visible_to?, to: :community

  validates :name, presence: true
end
