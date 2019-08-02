class Report < ApplicationRecord
  belongs_to :profile
  belongs_to :website

  validates :website_id, presence: true
  validates :profile_id, presence: true
  # validates :wpt_id, presence: true
  # validates :status_code, presence: true

  scope :pending, -> { order('updated_at').where(['status_code < ?', 200]) }
  scope :complete, -> { order('updated_at').where(status_code: 200) }
  scope :errored, -> { order('updated_at').where(['status_code > ?', 200]) }
  scope :dated, -> { order('updated_at') }
end
