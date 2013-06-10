class Post < ActiveRecord::Base
  attr_accessible :body

  belongs_to :topic, inverse_of: :posts
  belongs_to :author, class_name: "User"

  validates :body, presence: true
end
