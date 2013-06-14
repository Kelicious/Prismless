class Post < ActiveRecord::Base
  attr_accessible :body, :topic_id

  belongs_to :topic, inverse_of: :posts
  belongs_to :author, class_name: "User"

  delegate :community, to: :topic
  delegate :visible_to?, to: :community

  validates :body, :topic, presence: true

  after_create :set_topic_last_post_at

  private

  def set_topic_last_post_at
    topic.update_attribute(:last_post_at, created_at)
  end
end
