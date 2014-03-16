class Backend::DealersController < Backend::ApplicationController
  defaults :resource_class => Dealer, :collection_name => 'dealers', :instance_name => 'dealer'
  prepend_before_filter :draw_password, only: :update

  private
    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:dealer].delete(attr)
      end if params[:dealer] && params[:dealer][:password].blank?
    end

end