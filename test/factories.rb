FactoryBot.define do
  factory :ruby, class: Product do
    title { "Programming with Ruby" }
    description { "For all levels" }
    price { 19.95 }
  end
end