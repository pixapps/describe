require 'rails_helper'

RSpec.describe Book, type: :model do

	describe 'validations' do
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to validate_presence_of(:description) }

	end

	describe 'associations' do

	end

end
