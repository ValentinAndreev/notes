FactoryGirl.define do
  factory :task do
    text "Text"
    status false
    date Date.today
  end
end