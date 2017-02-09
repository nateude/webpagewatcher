class Profile < ApplicationRecord
  belongs_to :website
  has_many :report
end
