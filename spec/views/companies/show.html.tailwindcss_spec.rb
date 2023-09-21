require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    assign(:company, Company.create!(
      name: "Name",
      key: "Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Key/)
  end
end
