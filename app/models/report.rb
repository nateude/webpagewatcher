class Report < ApplicationRecord
  belongs_to :profile
  belongs_to :website

  validates :website_id, presence: true
  validates :profile_id, presence: true
  validates :wpt_id, presence: true
  validates :status_code, presence: true
end
