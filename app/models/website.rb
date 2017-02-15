class Website < ApplicationRecord
  has_many :profile
  has_many :report
end
