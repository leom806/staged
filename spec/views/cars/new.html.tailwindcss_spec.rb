require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      brand: "MyString",
      model: "MyString",
      version: "MyString",
      type: "",
      plate: "MyString",
      mileage: 1,
      year_make: 1,
      year_model: 1,
      color: "MyString"
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

      assert_select "input[name=?]", "car[brand]"

      assert_select "input[name=?]", "car[model]"

      assert_select "input[name=?]", "car[version]"

      assert_select "input[name=?]", "car[type]"

      assert_select "input[name=?]", "car[plate]"

      assert_select "input[name=?]", "car[mileage]"

      assert_select "input[name=?]", "car[year_make]"

      assert_select "input[name=?]", "car[year_model]"

      assert_select "input[name=?]", "car[color]"
    end
  end
end
