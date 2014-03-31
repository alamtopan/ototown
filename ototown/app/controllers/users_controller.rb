class UsersController < ApplicationController
  prepend_before_filter :draw_password, only: :update
  before_filter :authenticate_user!

	def user_home
    @user = current_user 
		render layout: 'application_user'
	end

	def user_profile
    @user = current_user 
		render layout: 'application_user'
	end

  def update
    @user = current_user  
    if @user.update_attributes(params[:user])   
      flash[:notice] = "Successfully updated profile!" 
      redirect_to user_profile_path
    else  
      redirect_to user_profile_path
    end  
  end

  private    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:admin].delete(attr)
      end if params[:admin] && params[:admin][:password].blank?
    end

    def set_object
      @user = current_user
    end

end