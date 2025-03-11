FactoryBot.define do
  factory :domain, class: 'Abizvn::Clients::Domain' do
    sequence(:name) { |n| "subdomain#{n}.example.com" }
    
    association :client, factory: :client
  end
end
