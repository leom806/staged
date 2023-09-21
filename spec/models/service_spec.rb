require 'rails_helper'

RSpec.describe Service, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
