class Topic < ActiveRecord::Base
  include Concerns::Viewable

  attr_accessible :title, :forum_id, :posts_attributes

  alias_attribute :pinned?, :pinned

  has_many :posts, inverse_of: :topic, dependent: :destroy
  accepts_nested_attributes_for :posts
  
  belongs_to :forum, inverse_of: :topics
  belongs_to :creator, class_name: "User"

  delegate :community, to: :forum
  delegate :visible_to?, to: :community

  validates :title, :forum, :creator, :posts, presence: :true

  before_save :set_first_post_author

  def self.by_pinned
    order('topics.pinned DESC').order('topics.last_post_at DESC')
  end

  def views_count
    views.sum(:count)
  end

  def new_to?(user)
    view = view_for(user)
    !view || (view.updated_at < last_post_at)
  end

  private

  def set_first_post_author
    posts.first.author = creator
  end
end
