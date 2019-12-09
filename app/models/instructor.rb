class Instructor < ApplicationRecord
  has_many :applications, through: recommandations
  belongs_to :user
end
