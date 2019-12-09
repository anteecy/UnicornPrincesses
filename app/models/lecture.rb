class Lecture < ApplicationRecord
	has_many :labs
	belongs_to :application
	belongs_to :courses
end
