class Forum < ActiveRecord::Base
  attr_accessible :name, :description, :category_id

  has_many :topics, inverse_of: :forum, dependent: :destroy
  has_many :posts, through: :topics, dependent: :destroy
  belongs_to :category, inverse_of: :forums
  delegate :community, to: :category

  validates :name, :description, presence: :true

  default_scope order('forums.name ASC')

  def last_post_for(user)
    posts.last
  end
end
