class HomeController < ApplicationController
  def index
    redirect_to cars_path if user_signed_in? && user_masquerade? && current_user.customer?
  end
end
