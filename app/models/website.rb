class Website < ApplicationRecord
  has_many :profile, dependent: :restrict_with_exception
  has_many :report, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
