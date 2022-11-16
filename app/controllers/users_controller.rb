class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome #{@user.username}!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      if @user.logged_in
      else
        flash[:danger] = "Você não tem acesso a esta página"
        redirect_to user_path(@user)
      end
    end
end
