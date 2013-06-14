class Community < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :privacy, :password, :password_confirmation

  has_many :categories, inverse_of: :community, dependent: :destroy
  has_many :adminships, inverse_of: :community, dependent: :destroy
  has_many :admins, through: :adminships, source: :user
  has_many :memberships, inverse_of: :community, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: :private?
  validates :password_confirmation, presence: true, if: :private?

  def has_admin?(user)
    admins.include?(user)
  end

  def public?
    privacy == "public"
  end

  def visible_to?(user)
    public? || admins.include?(user) || members.include?(user)
  end

  def authenticate(unencrypted_password)
    BCrypt::Password.new(password_digest) == unencrypted_password && self
  end
  
  def private?
    privacy == "private"
  end

  def password=(unencrypted_password)
    unless unencrypted_password.blank?
      @password = unencrypted_password
      cost = BCrypt::Engine::DEFAULT_COST
      self.password_digest = BCrypt::Password.create(unencrypted_password, cost: cost)
    end
  end

  def password_confirmation=(unencrypted_password)
    @password_confirmation = unencrypted_password
  end

  private

  attr_reader :password, :password_confirmation
end
