class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Everyone can create a new user (sign up, and submit create)
  before_action :authorize, except: [:new, :create, :update]

  # Only admin can:
  before_action :authorize_admin, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user.admin?
     @users = User.all 
     else
      @users = [current_user]
    end

    (current_user.admin?) ? 
    ($size = 'col-md-7' and $size1 = 'col-md-7' and $li_head = 'ALL USERS') : 
    ($size = 'col-md-5' and $size1 = 'col-md-9' and $li_head = 'MY USER')
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.admin? || correct_user?
      @user = User.find(params[:id])       
  end

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if current_user.admin? || correct_user?
      @user = User.find(params[:id])
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'User was successfully created. Please login...' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
