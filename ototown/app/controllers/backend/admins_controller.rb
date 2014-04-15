class Backend::AdminsController < Backend::ApplicationController
  defaults :resource_class => Admin, :collection_name => 'admins', :instance_name => 'admin'
  prepend_before_filter :draw_password, only: :update

  def update
    @user = Admin.find(params[:id])  
    if @user.update_attributes(params[:admin])   
      flash[:notice] = "Successfully updated profile!" 
      redirect_to edit_backend_admin_path
    else  
      redirect_to edit_backend_admin_path
    end  
  end

  # Override fungsi halaman edit
  def edit
    @user = Admin.find(params[:id]) 
  end

  private    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:admin].delete(attr)
      end if params[:admin] && params[:admin][:password].blank?
    end
end