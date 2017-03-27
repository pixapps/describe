require 'rails_helper'

RSpec.describe Book, type: :model do
	describe 'validations' do
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:description) }
		it { should validate_length_of(:name).is_at_least(3) }
		it { should validate_length_of(:description).is_at_least(10) }
	end

	describe 'associations' do
	end
end
