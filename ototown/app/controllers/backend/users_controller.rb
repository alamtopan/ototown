class Backend::UsersController < Backend::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  prepend_before_filter :draw_password, only: :update
  def index
    @users = User.all
  end

  def new
    @user = User.new    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'user was successfully saved'
      redirect_to backend_user_path(@user)
    else
      render action: 'new'
    end
  end

  def show
    
  end

  def edit    
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'user was successfully updated'
      redirect_to edit_backend_user_path(@user)
    else
      render action: 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'user was successfully removed'
    else
      flash[:error] = 'Failed to remove user'
    end

    redirect_to backend_users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, 
          profiles_attributes: [:full_name, :birthday, :gender, :address, :city, :codepos, :phone] )
    end
    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:user].delete(attr)
      end if params[:user] && params[:user][:password].blank?
    end
end