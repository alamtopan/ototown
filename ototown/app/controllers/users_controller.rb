class UsersController < ApplicationController
  prepend_before_filter :draw_password, only: :update
  before_filter :authenticate_user!

	def user_home
    @products = current_user.products.page(params[:page])
		render layout: 'application_user'
	end

	def user_profile
    @user = User.find(current_user.id) 
		render layout: 'application_user'
	end

  def update
    @user = User.find(current_user.id)  
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

end