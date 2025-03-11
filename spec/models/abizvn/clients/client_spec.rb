require 'rails_helper'

RSpec.describe Abizvn::Clients::Client, type: :model do
  describe "validations" do
    context 'name validations' do
      before { FactoryBot.create(:client) }

      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name).case_insensitive }
      it { should validate_length_of(:name).is_at_most(128) }
    end

    context 'email fields validations' do
      it { should validate_presence_of(:admin_user_email) }

      invalid_samples = ['invalid_email', 'invalid@email', 'invalid@email@com'].each do |sample|
        it { should_not allow_value(sample).for(:admin_user_email) }
        it { should_not allow_value(sample).for(:contact_email) }
      end
  
      valid_samples = ['valid@example.com', 'valid_123@example.com', 'valid@sub.example.com'].each do |sample|
        it { should allow_value(sample).for(:admin_user_email) }
        it { should allow_value(sample).for(:contact_email) }
      end
    end
    
    context 'contact_phone_number' do
      it 'is valid when blank' do
        model = FactoryBot.build(:client, contact_phone_number: nil)
        expect(model).to be_valid
        model = FactoryBot.build(:client, contact_phone_number: "")
        expect(model).to be_valid
      end

      it 'is valid with a possible phone number' do
        model = FactoryBot.build(:client, contact_phone_number: '+15551234567')
        expect(model).to be_valid
      end

      it 'is invalid with an impossible phone number' do
        model = FactoryBot.build(:client, contact_phone_number: '123')
        expect(model).not_to be_valid
        expect(model.errors[:contact_phone_number]).to include('is invalid')
      end

      it 'is invalid with a badly formatted phone number' do
        model = FactoryBot.build(:client, contact_phone_number: 'abcde')
        expect(model).not_to be_valid
        expect(model.errors[:contact_phone_number]).to include('is invalid')
      end
    end
  end

  describe 'associations' do
    it { should have_many(:domains) }
  end

end