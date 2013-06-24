class View < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :viewable, polymorphic: true, inverse_of: :views
  belongs_to :user

  validates :viewable_id, :viewable_type, :user_id, presence: true
end
