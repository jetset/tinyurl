FactoryBot.define do
  factory :token do
    sequence(:key) { |n| "abc123#{n}" }
  end

  trait :first_key do
    key { 'abcd1234' }
  end

end
