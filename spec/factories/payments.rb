FactoryGirl.define do
  factory :payment do
    amount 100_000
    paid_at { Date.today }
  end
end
