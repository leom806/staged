FactoryBot.define do
  factory :services_step, class: 'Services::Step' do
    service_id { 1 }
    name { "MyString" }
    description { "MyString" }
  end
end

# == Schema Information
#
# Table name: services_steps
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  status      :integer          default("pending"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  service_id  :integer          not null
#
