class Book < ApplicationRecord

	# validations
	validates_presence_of :name, :description


	def to_s
		name
	end
end
