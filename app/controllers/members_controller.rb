class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]
  before_action :set_project, only: [:index]

  # GET /members
  def index
    render json: @project.members
  end

  # GET /members/1
  def show
    render json: @member.to_json(:include => [:projects])
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(:name, :email)
    end
end
