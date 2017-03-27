class Book < ApplicationRecord

	# validations
	validates_presence_of :name, :description
end
