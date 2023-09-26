class Services::Step < ApplicationRecord
  belongs_to :service, class_name: "Services::Service"

  scope :sorted, -> { order(status: :desc, name: :asc) }

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
