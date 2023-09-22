class Services::Step < ApplicationRecord
  belongs_to :service, class_name: "Services::Service"

  enum status: {
    pending: 0,
    in_progress: 1,
    done: 2,
    canceled: 3,
  }
end

# == Schema Information
#
# Table name: services_steps
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  service_id  :integer          not null
#
