class Post < ActiveRecord::Base
  attr_accessible :body, :topic_id

  belongs_to :topic, inverse_of: :posts
  belongs_to :author, class_name: "User"

  validates :body, :topic, presence: true
end
