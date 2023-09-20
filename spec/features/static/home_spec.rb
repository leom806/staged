require 'rails_helper'

describe "Home Page", type: :system do
  it "shows the home page" do
    visit root_path

    expect(page).to have_content 'Login'
  end
end
