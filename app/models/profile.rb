class Profile < ApplicationRecord
  belongs_to :website
  has_many :report, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
  validates :website_id, presence: true
  validates :url, presence: true
end
