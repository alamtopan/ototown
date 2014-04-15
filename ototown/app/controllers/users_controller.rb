class UsersController < ApplicationController
  prepend_before_filter :draw_password, only: :update
  before_action :set_object
  before_filter :authenticate_user!
  before_filter :sex
  before_filter :category_type

	def user_home
		render layout: 'application_user'
	end

	def user_profile
		render layout: 'application_user'
	end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile!"
      redirect_to user_profile_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to user_profile_path
    end
  end

  def be_dealer
    if @user.update(dealer_info_params.merge({active: false}))
      info = @user.dealer_info
      info.active = false
      if info.save
        flash[:notice] = 'Thanks You. We Will Verify Your Data'
      else
        flash[:errors] = info.errors.full_messages
      end
    else
      flash[:errors] = @user.errors.full_messages
    end
    redirect_to user_profile_path
  end

  def edit_be_dealer
    if @user.update(dealer_info_params.merge({active: true}))
      info = @user.dealer_info
      info.active = true
      if info.save
        flash[:notice] = 'Successfully Update Your Data'
      else
        flash[:errors] = info.errors.full_messages
      end
    else
      flash[:errors] = @user.errors.full_messages
    end
    redirect_to user_profile_path
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

    def dealer_info_params
      params.require(:user).permit(dealer_info_attributes: [:title,:address,:phone,:description,:email,:longitude, :latitude, :category_type, :active],
        images_attributes:[:image])
    end

    def category_type
      category_type = ['Dealer', 'Workshop']
      @category_type = category_type.map{|category_type| [category_type, category_type]}
    end

    def sex
      sex = ['Laki-Laki', 'Perempuan']
      @sex = sex.map{|sex| [sex, sex]}
    end

end