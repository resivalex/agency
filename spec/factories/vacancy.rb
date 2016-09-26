FactoryGirl.define do
  factory :vacancy do
    name 'Vacancy'
    phone '12-34-56'
    email 'test@example.com'
    salary 50_000
    expires_at Time.current + 1.day
  end
end
