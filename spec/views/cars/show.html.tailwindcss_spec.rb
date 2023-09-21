require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    assign(:car, Car.create!(
      brand: "Brand",
      model: "Model",
      version: "Version",
      type: "Type",
      plate: "Plate",
      mileage: 2,
      year_make: 3,
      year_model: 4,
      color: "Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Version/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Plate/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Color/)
  end
end
