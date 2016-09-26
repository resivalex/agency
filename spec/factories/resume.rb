FactoryGirl.define do
  factory :resume do
    first_name 'First'
    last_name 'Last'
    phone '12-34-56'
    email 'test@example.com'
    desired_salary 50_000
    is_active true
  end
end
