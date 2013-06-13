class Community < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name

  has_many :categories, inverse_of: :community, dependent: :destroy
  has_many :admins
  has_many :adminships, inverse_of: :community, dependent: :destroy
  has_many :admins, through: :adminships, source: :user

  validates :name, presence: true

  def has_admin?(user)
    admins.include?(user)
  end
end
