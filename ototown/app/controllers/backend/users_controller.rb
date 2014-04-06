class Backend::UsersController < Backend::ApplicationController
  defaults :resource_class => User, :collection_name => 'users', :instance_name => 'user'
  prepend_before_filter :draw_password, only: :update
  before_filter :sex

  def add_dealer
    @user = User.find(params[:id])
    usr = @user.dealer_info
    usr.active = false
    if usr.save
      flash[:notice] = 'User Has Been Change To Dealer'
    else
      flash[:error] = 'Failed To Add Dealer'
    end
    redirect_to dealers_request_backend_dealers_path 
  end

  private    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:user].delete(attr)
      end if params[:user] && params[:user][:password].blank?
    end

    def sex
      sex = ['Laki-Laki', 'Perempuan']
      @sex = sex.map{|sex| [sex, sex]}
    end
end