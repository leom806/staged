require 'rails_helper'

describe "Home Page", type: :system do
  it "shows the home page" do
    sign_out
    visit root_path

    expect(page).to have_content 'Entrar'
  end
end
