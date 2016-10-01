class StandupsController < ApplicationController
  before_action :set_standup, only: [:show, :update, :destroy]

  # GET /standups/1
  def show
    render json: @standup.to_json(:include => [:project, :member])
  end

  # POST /standups
  def create
    @standup = Standup.new(create_standup_params)

    if @standup.save
      render json: @standup, status: :created, location: @standup
    else
      render json: @standup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /standups/1
  def update
    if @standup.update(update_standup_params)
      render json: @standup
    else
      render json: @standup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /standups/1
  def destroy
    @standup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standup
      @standup = Standup.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def create_standup_params
      params.require(:standup).permit(:did, :doing, :impediments, :project_id, :member_id)
    end

    def update_standup_params
      params.require(:standup).permit(:did, :doing, :impediments)
    end
end
