class ServicesController < ApplicationController
  def index
    @services = Service.all.sorted
  end
end
