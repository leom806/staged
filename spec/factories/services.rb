FactoryBot.define do
  factory :service do
    company_id { 1 }
    customer_id { 1 }
    car_id { 1 }
    name { "Troca de Óleo" }
    description { "Consiste na realização da troca do óleo do motor" }
  end
end

# == Schema Information
#
# Table name: services
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  status      :integer          default("pending"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  car_id      :integer          not null
#  company_id  :integer          not null
#  customer_id :integer          not null
#
