FactoryGirl.define do
  factory :borrower do
    credit_amount 1_000_000
    credit_taken_at { Date.today }
    credit_term 6
    base_rate  0.3
    delay_rate 0.5
  end
end
