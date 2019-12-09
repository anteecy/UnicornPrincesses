# Represents an application
class GraderApplication < ApplicationRecord

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :courses, presence: true
	
	has_many :lectures
	has_many :labs

end
