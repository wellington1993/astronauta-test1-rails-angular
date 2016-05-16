class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :update, :destroy]

  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.all

    render json: @missions, include: :astronauts
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
    render json: @mission, include: :astronauts
  end

  # GET /missions/1/availables
  # GET /missions/1/avalables.json
  def availables
    @astronauts = Astronaut.where(mission_id: nil)
    render json: @astronauts
  end

  # POST /missions
  # POST /missions.json
  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      render json: @mission, status: :created, location: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /missions/1
  # PATCH/PUT /missions/1.json
  def update
    @mission = Mission.find(params[:id])

    if @mission.update(mission_params)
      head :no_content
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission.destroy

    head :no_content
  end

  private

    def set_mission
      @mission = Mission.find(params[:id])
    end

    def mission_params
      params.permit(:name, :id, :created_at, :updated_at)
    end
end
