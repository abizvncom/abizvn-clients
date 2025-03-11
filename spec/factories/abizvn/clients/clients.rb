FactoryBot.define do
  factory :client, class: 'Abizvn::Clients::Client' do
    sequence(:name) { |n| "Test Name #{n}" }
    sequence(:admin_user_email) { |n| "admin#{n}@example.com" }
  end
end