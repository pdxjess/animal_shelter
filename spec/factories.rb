FactoryBot.define do
  factory :animal do
    name "Buddha"
    species "Cat"
    sex "F"
    birthday Date.today - 5.year
    description "A sweet and friendly cat who loves her belly being rubbed and being hand fed treats."
    arrival_date Date.today - 1.month
  end
end
