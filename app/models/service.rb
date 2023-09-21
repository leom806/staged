class Service < ApplicationRecord
  belongs_to :company
  belongs_to :customer, class_name: "User"
  belongs_to :car

  scope :sorted, -> { order(status: :desc, id: :asc) }

  enum status: {
    pending: 0,
    in_progress: 1,
    done: 2,
    canceled: 3,
  }
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
