require 'rails_helper'

describe "Customers Page", type: :system do
  let(:admin) { create(:user, role: :admin) }

  let!(:customer_A) { create(:user, role: :customer) }
  let!(:customer_B) { create(:user, role: :customer) }
  let!(:customer_C) { create(:user, role: :customer) }

  it "shows all clients to admin" do
    sign_in admin
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content 'Clientes'
    expect(page).to have_content customer_A.name
    expect(page).to have_content customer_A.email
  end

  it "shows unauthorized to customer" do
    sign_in customer_A
    visit root_path
    expect(page).to_not have_content 'Clientes'

    expect {
      visit customers_path
    }.to raise_error(CanCan::AccessDenied)
  end
end
