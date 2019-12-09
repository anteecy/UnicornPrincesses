 
 # Represents a student user of the website
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # TODO: Make id a primary key field that auto increments?
  # validates :id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  # validates :confirmation, presence: true

  # has_one :application
  has_many :instructors

end
