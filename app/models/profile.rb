class Profile < ApplicationRecord
  belongs_to :website
  has_one :user, through: :website
  has_many :report, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :website_id, presence: true
  validates :url, presence: true
end
