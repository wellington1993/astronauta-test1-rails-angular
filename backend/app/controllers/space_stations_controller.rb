class SpaceStationsController < ApplicationController
  before_action :set_space_station, only: [:show, :update, :destroy]

  # GET /space_stations
  # GET /space_stations.json
  def index
    @space_stations = SpaceStation.all

    render json: @space_stations, include: :astronauts

  end

  # GET /space_stations/1
  # GET /space_stations/1.json
  def show
    render json: @space_station
  end

  # POST /space_stations
  # POST /space_stations.json
  def create
    @space_station = SpaceStation.new(space_station_params)

    if @space_station.save
      render json: @space_station, status: :created, location: @space_station
    else
      render json: @space_station.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /space_stations/1
  # PATCH/PUT /space_stations/1.json
  def update
    @space_station = SpaceStation.find(params[:id])

    if @space_station.update(space_station_params)
      head :no_content
    else
      render json: @space_station.errors, status: :unprocessable_entity
    end
  end

  # DELETE /space_stations/1
  # DELETE /space_stations/1.json
  def destroy
    @space_station.destroy

    head :no_content
  end

  private

    def set_space_station
      @space_station = SpaceStation.find(params[:id])
    end

    def space_station_params
      params.permit(:name, :description)
    end
end
