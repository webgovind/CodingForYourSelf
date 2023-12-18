class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
   
  # GET /users
  def index
    @users = User.all
  end
  
  # GET /users/{id}
  def show
    if @user.present?
      render 'show'
    else
      render 'index'
    end
  end
  

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/{id}/edit
  def edit
    # Your edit action code goes here
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render 'layouts/homepage'
      # redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/{id}
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def sign_in 
  end
  
  # DELETE /users/{id}
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :contactno, :role)
  end
end


