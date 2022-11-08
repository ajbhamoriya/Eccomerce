class Physician < ApplicationRecord
	has_many :appointments
	has_many :patients, :through => :appointments
	has_one_attached :photo
end
