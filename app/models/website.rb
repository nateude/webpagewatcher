class Website < ApplicationRecord
  has_many :profile
  has_many :report

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
