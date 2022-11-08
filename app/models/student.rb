class Student < ApplicationRecord
	has_many :teachers
	has_many :subjects, through: :teachers
	validate :check_length
	def check_length
		if self.name.length < 5
			errors.add(:name, "is too short so please enter a name more than 5 characters")
		end
	end
end

