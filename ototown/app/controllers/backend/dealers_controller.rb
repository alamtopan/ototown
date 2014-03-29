class Backend::DealersController < Backend::ApplicationController
  defaults :resource_class => Dealer, :collection_name => 'dealers', :instance_name => 'dealer'
  prepend_before_filter :draw_password, only: :update

  def index
  	@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").order("operators.id DESC")
  end

  def dealers_request
  	@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = FALSE").order("operators.id DESC")
  end

  def approve_dealer
  	@dealer = DealerInfo.find_by_dealer_id(params[:id])
  	if @dealer.update({active: true})
  		flash[:notice] = "Dealer Request Approved"
  	elsif
  		flash[:error] = "Failed To Approved"
  	end
  	redirect_to backend_dealers_path
  end

  def unapprove_dealer
  	@dealer = DealerInfo.find_by_dealer_id(params[:id])
  	if @dealer.update({active: false})
  		flash[:notice] = "Dealer Request Unapproved"
  	elsif
  		flash[:error] = "Failed To Unapproved"
  	end
  	redirect_to dealers_request_backend_dealers_path
  end

  private
    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:dealer].delete(attr)
      end if params[:dealer] && params[:dealer][:password].blank?
    end

end