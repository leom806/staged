require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        brand: "Brand",
        model: "Model",
        version: "Version",
        type: "Type",
        plate: "Plate",
        mileage: 2,
        year_make: 3,
        year_model: 4,
        color: "Color"
      ),
      Car.create!(
        brand: "Brand",
        model: "Model",
        version: "Version",
        type: "Type",
        plate: "Plate",
        mileage: 2,
        year_make: 3,
        year_model: 4,
        color: "Color"
      )
    ])
  end

  it "renders a list of cars" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Brand".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Model".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Version".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Plate".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Color".to_s), count: 2
  end
end
