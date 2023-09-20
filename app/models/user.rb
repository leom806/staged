class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true, uniqueness: true
end
