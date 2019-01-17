FactoryBot.define do
  factory :order_item do
    product { nil }
    order { nil }
    unit_price { 1 }
    quantity { 1 }
    total_price { 1 }
  end
end
