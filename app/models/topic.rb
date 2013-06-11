class Topic < ActiveRecord::Base
  attr_accessible :title, :forum_id, :posts_attributes

  has_many :posts, inverse_of: :topic, dependent: :destroy
  accepts_nested_attributes_for :posts
  
  belongs_to :forum, inverse_of: :topics
  belongs_to :creator, class_name: "User"

  validates :title, :forum, :creator, presence: :true
end
