require 'rails_helper'
describe 'user' do
  it { is_expected.to have_many :reviewed_restaurants }
end
