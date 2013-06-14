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

  has_many :topics, foreign_key: "creator_id", inverse_of: :creator
  has_many :posts, foreign_key: "author_id", inverse_of: :author

  has_many :adminships, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_communities, through: :favorites, source: :community

  validates :name, presence: true

  def is_admin?(community)
    community.has_admin?(self)
  end
end
