class Profile < ApplicationRecord
  belongs_to :website
  has_many :report

  validates :name, presence: true, uniqueness: true
  validates :website_id, presence: true
  validates :url, presence: true
end
