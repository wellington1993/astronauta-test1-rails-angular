class AstronautsController < ApplicationController
  before_action :set_astronaut, only: [:show, :update, :destroy]

  # GET /astronauts
  # GET /astronauts.json
  def index
    @astronauts = Astronaut.all

    render json: @astronauts
  end

  # GET /astronauts/availables
  # GET /astronauts/availables.json
  def availables
    @astronauts = Astronaut.where(mission_id: [nil])
    render json: @astronauts
  end

  # GET /astronauts/1
  # GET /astronauts/1.json
  def show
    render json: @astronaut
  end

  # POST /astronauts
  # POST /astronauts.json
  def create
    @astronaut = Astronaut.new(astronaut_params)

    if @astronaut.save
      render json: @astronaut, status: :created, location: @astronaut
    else
      render json: @astronaut.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /astronauts/1
  # PATCH/PUT /astronauts/1.json
  def update
    @astronaut = Astronaut.find(params[:id])

    if @astronaut.update(astronaut_params)
      head :no_content
    else
      render json: @astronaut.errors, status: :unprocessable_entity
    end
  end

  # DELETE /astronauts/1
  # DELETE /astronauts/1.json
  def destroy
    @astronaut.destroy

    head :no_content
  end

  private

    def set_astronaut
      @astronaut = Astronaut.find(params[:id])
    end

    def astronaut_params
      params.permit(:id, :created_at, :updated_at, :name, :birthdate, :mission_id, :space_station_id)
    end
end
