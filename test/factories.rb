FactoryBot.define do
  factory :ruby, class: Product do
    title { "Programming with Ruby" }
    description { "For all levels" }
    price { 19.95 }
  end

  factory :cat, class: Product do
    title { "Programming with Cats 2" }
    description { "Fun for all levels" }
    price { 29.95 }
  end

  factory :cart, class: Cart do
  end

  factory :my_cart, class: Cart do
  end

  factory :line_item, class: LineItem do
    association :product, factory: :ruby
    association :cart, factory: :cart
  end

  factory :item, class: LineItem do
    association :product, factory: :cat
    association :my_cart, factory: :cart
  end
end