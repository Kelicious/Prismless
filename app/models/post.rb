class Post < ActiveRecord::Base
  attr_accessible :body, :topic_id

  has_many :votes, inverse_of: :post

  belongs_to :topic, inverse_of: :posts
  belongs_to :author, class_name: "User"

  delegate :community, to: :topic
  delegate :visible_to?, to: :community

  validates :body, :topic, presence: true

  after_create :set_topic_last_post_at

  def points
    @points ||= votes.sum("votes.value")
  end

  private

  def set_topic_last_post_at
    topic.update_attribute(:last_post_at, created_at)
  end
end
