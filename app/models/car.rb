class Car < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :user

  has_many :services, class_name: "Services::Service", dependent: :destroy

  before_validation :upcase_plate

  validates :brand, :model, :year_model, :mileage, :plate, :color, presence: true
  validates :year_make,  inclusion: { in: 1900..Date.today.year }
  validates :year_model, inclusion: { in: 1900..Date.today.year }
  validates :plate, uniqueness: true, format: { with: /\A[A-Z]{3}-\d[A-Z0-9]\d{2}\z/i }
  validates :mileage, numericality: { greater_than_or_equal_to: 0 }

  with_options(if: -> { !new_record? }) do
    validates :mileage, numericality: { greater_than_or_equal_to: :mileage_was }
  end

  def to_s
    "#{brand} #{model} #{year_model}"
  end

  private

  def upcase_plate
    self.plate = plate.to_s.upcase
  end
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
