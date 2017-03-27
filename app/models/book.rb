class Book < ApplicationRecord

	# validations
	validates_presence_of :name, :description
	validates_length_of :name, minimum: 3


	def to_s
		name
	end
end
