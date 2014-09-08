class ProjectsController < ApplicationController
  before_filter :authenticate

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :user_is_admin, only: [:edit,:update,:destroy]
  # GET /projects
  # GET /projects.json
  def index
    if current_user.admin
      @projects = Project.all
    else
      @projects = Project.where(id = current_user.project_id)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
     @users = User.all.paginate(:page => params[:page],per_page: 5)

  end

  # GET /projects/new
  def new
    if current_user.admin
    @project = Project.new
    else
    flash[:notice] = "Only admins can create Projects"
    redirect_to root_path
    end
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def AddUser
    @user = User.find(params[:id])
    @project = Project.find(params[:pid])

    if !@project.users.include?(@user)
      
    
    @project.users.append(@user)
    if @project.save
      flash[:notice] = "Successfully added #{@user.firstname} #{@user.lastname} to #{@project.name} ."
    else
      flash[:error] = "Failed to insert #{@user.firstname} #{@user.lastname} to #{@project.name} ."
    end

    else
      flash[:notice] = "#{@user.firstname} #{@user.lastname} is working on #{@project.name} ."
    end  
    redirect_to @project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:user_id, :micropost_id, :name)
    end


end
