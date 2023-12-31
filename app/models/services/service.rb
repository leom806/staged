class Services::Service < ApplicationRecord
  belongs_to :car

  has_many :steps, class_name: "Services::Step", dependent: :destroy

  scope :sorted, -> { order(status: :desc, id: :asc) }

  enum status: {
    pending: 0,
    in_progress: 1,
    done: 2,
    canceled: 3,
  }

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: services_services
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  status      :integer          default("pending"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  car_id      :integer          not null
#
