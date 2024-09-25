# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

def calculate_m(p, r, n)
  numerator = r * (1 + r)**n
  denominator = (1 + r)**n - 1
  m = p * (numerator / denominator)
  return m
end

purchase_price = rand(200000..99999999)
down_payment = purchase_price * rand(5..20) * 0.01
interest_rate = rand(1..7) + rand.round(2)
amortization = rand(1..5) * 5
property_tax = (rand(0.0028..0.026) * purchase_price).round(2)

20.times do
  property = Property.new(
    address: Faker::Address.full_address,
    purchase_price: purchase_price,
    interest_rate: interest_rate,
    amortization: amortization,
    down_payment: down_payment,
    loan_amount: purchase_price - down_payment,
    monthly_payment: calculate_m(purchase_price, interest_rate, (amortization * 12)),
    property_tax: property_tax
  )
  property.save
end