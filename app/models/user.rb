class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable

  validates :name, presence: true, uniqueness: true

  has_many :website, dependent: :restrict_with_exception
  has_many :profile, through: :website
  has_many :report, through: :profile
end
