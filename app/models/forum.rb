class Forum < ActiveRecord::Base
  attr_accessible :name, :category_id

  has_many :topics, inverse_of: :forum, dependent: :destroy

  validates :name, presence: :true

  default_scope order('forums.name ASC')
end
