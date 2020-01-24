class Report < ApplicationRecord
  belongs_to :profile

  validates :profile_id, presence: true
  # validates :wpt_id, presence: true
  # validates :status_code, presence: true

  scope :pending, -> { order('updated_at DESC').where(['status_code < ?', 200]) }
  scope :complete, -> { order('updated_at DESC').where(status_code: 200) }
  scope :errored, -> { order('updated_at DESC').where(['status_code > ?', 200]) }
  scope :dated, -> { order('updated_at DESC') }
end
