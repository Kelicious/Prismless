class Topic < ActiveRecord::Base
  attr_accessible :title, :forum_id, :posts_attributes

  has_many :posts, inverse_of: :topic, dependent: :destroy
  accepts_nested_attributes_for :posts
  
  belongs_to :forum, inverse_of: :topics
  belongs_to :creator, class_name: "User"

  delegate :community, to: :forum
  delegate :visible_to?, to: :community

  validates :title, :forum, :creator, :posts, presence: :true

  before_save :set_first_post_author

  default_scope order('topics.last_post_at DESC')

  private

  def set_first_post_author
    posts.first.author = creator
  end
end
