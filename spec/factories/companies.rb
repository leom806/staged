FactoryBot.define do
  factory :company do
    name { "Car Shop" }
    key { "car_shop" }
  end
end

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  key        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
