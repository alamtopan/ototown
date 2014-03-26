class Backend::UsersController < Backend::ApplicationController
  defaults :resource_class => User, :collection_name => 'users', :instance_name => 'user'
  prepend_before_filter :draw_password, only: :update

  def add_dealer
    @user = User.find(params[:id])
    if @user.update({role_id: Dealer::ROLE_ID})
      flash[:notice] = 'User Has Been Change To Dealer'
    else
      flash[:error] = 'Failed To Add Dealer'
    end
    redirect_to edit_backend_dealer_path(@user)
  end

  private    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:user].delete(attr)
      end if params[:user] && params[:user][:password].blank?
    end
end