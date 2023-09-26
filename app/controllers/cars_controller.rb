class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars
  def index
    authorize! :index, Car

    @cars = Car.includes(:services)
    @cars = @cars.where(user: filtered_user)
    @cars = @cars.order(brand: :asc, model: :asc, year_model: :asc)
  end

  # GET /cars/1
  def show
    authorize! :read, @car

    redirect_to edit_car_path(@car)
  end

  # GET /cars/new
  def new
    authorize! :create, Car

    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
    authorize! :update, @car
  end

  # POST /cars
  def create
    authorize! :create, Car

    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    authorize! :update, @car

    if @car.update(car_params)
      redirect_to @car, notice: "Car was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    authorize! :destroy, @car

    @car.destroy
    redirect_to cars_url, notice: "Car was successfully destroyed.", status: :see_other
  end

  def modal
    authorize! :index, Car

    @service = Services::Service.find(params[:service_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:brand, :model, :version, :type, :plate, :mileage, :year_make, :year_model, :color, :user_id)
    end
end
