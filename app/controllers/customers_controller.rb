class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize! :index, User

    @q = User.customers
    @q = @q.search(params[:q]) if params[:q].present?
    @customers = @q.deep.sorted.page(params[:page])
  end
end
