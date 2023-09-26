class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize! :index, User

    @customers = User.all.customers.sorted.page(params[:page])
  end
end
