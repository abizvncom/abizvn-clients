require 'rails_helper'

RSpec.describe Abizvn::Clients::Domain, type: :model do
  describe "validations" do
    before { FactoryBot.create(:domain) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_most(255) }
  end

  describe 'associations' do
    it { should belong_to(:client).optional }
  end
end