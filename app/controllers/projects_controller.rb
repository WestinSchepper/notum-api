class ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :create]

  # GET /projects
  def index
    @projects = Project.all

    render json: @projects
  end

  # GET /projects/1
  def show
    render json: @project.to_json(:include => [:members, :standups])
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
  end

  # GET /projects/1/members
  def members
    render json: @project.members
  end

  # GET /projects/1/standups
  def standups
    render json: @project.standups.to_json(:include => [:member])
  end

  # TODO: Prevent duplicate members in a single project.
  # POST /projects/1/add_member
  def add_member
    member = Member.find(params[:member_id])
    # TODO: Figure out how this bitwise operator works and other ways to add the new member to the project.
    @project.members << member

    if @project.save
      render json: @project.to_json(:include => [:members])
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # POST /projects/1/remove_member
  def remove_member
    if @project.members.destroy(params[:member_id])
      render json: @project.to_json(:include => [:members])
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name)
    end

    def add_member_params
      params.permit(:member_id)
    end
end
