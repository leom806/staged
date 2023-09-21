require 'rails_helper'

RSpec.describe Car, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: cars
#
#  id         :bigint           not null, primary key
#  brand      :string           not null
#  color      :string           not null
#  mileage    :integer          not null
#  model      :string           not null
#  plate      :string           not null
#  type       :string
#  version    :string
#  year_make  :integer
#  year_model :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_cars_on_user_id  (user_id)
#
