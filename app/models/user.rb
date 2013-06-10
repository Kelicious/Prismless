class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # Custom
  attr_accessible :name

  has_many :threads, foreign_key: "creator_id", inverse_of: :creator
  has_many :posts, foreign_key: "author_id", inverse_of: :author

  validates :name, presence: true
end
