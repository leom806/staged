require 'rails_helper'

describe "Home Page", type: :system do
  let(:user) { create(:user) }

  it "shows the home page" do
    sign_out
    visit root_path

    expect(page).to have_content 'Entrar'
  end

  it "allows sign in" do
    sign_in user
    visit root_path

    expect(page).to have_content 'Sair'
  end

  it "allows sign out" do
    sign_in user
    sign_out
    visit root_path

    expect(page).to have_content 'Entrar'
  end
end
