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

  factory :line_item, class: LineItem do
    ruby
    cart
  end
end