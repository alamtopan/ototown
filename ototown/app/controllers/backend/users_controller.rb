class Backend::UsersController < Backend::ResourcesController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  prepend_before_filter :draw_password, only: :update
 

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