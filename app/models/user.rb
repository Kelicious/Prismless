class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # Custom
  attr_accessible :name

  # for oauth
  attr_accessible :provider, :uid

  has_many :topics, foreign_key: "creator_id", inverse_of: :creator
  has_many :posts, foreign_key: "author_id", inverse_of: :author

  has_many :adminships, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_communities, through: :favorites, source: :community

  validates :name, presence: true

  def self.find_or_create_by_facebook_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.create!(
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20],
                          name: auth.info.name
                          )
    end

    user
  end

  def favorited?(community)
    favorite_community_ids.include?(community.id)
  end

  def is_admin?(community)
    community.has_admin?(self)
  end

  def can_edit?(post)
    (id == post.author_id) || (is_admin?(post.community))
  end
end
