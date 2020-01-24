class Website < ApplicationRecord
  belongs_to :user

  has_many :profile, dependent: :restrict_with_exception
  has_many :report, through: :profile

  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  # validates :url, presence: true, uniqueness: true

  def user_sites
    Websites.where(user: current_user)
  end
end
