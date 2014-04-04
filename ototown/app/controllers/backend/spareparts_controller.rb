class Backend::SparepartsController < Backend::ApplicationController
  defaults :resource_class => Sparepart, :collection_name => 'spareparts', :instance_name => 'sparepart'
  prepend_before_filter :generate_select, except: [:index,:show]
  before_filter :choice_condition
  before_filter :choice_status

  def edit
    @sparepart = Sparepart.find_by(slug: params[:id])
  end

  def update
    @sparepart = Sparepart.find_by(slug: params[:id])
    if @sparepart.update(product_params)
      flash[:notice] = "Your Product Changed"
      redirect_to backend_spareparts_path
    else
      flash[:alert] = @sparepart.errors.full_messages
      redirect :back
    end
  end

  private
    def generate_select
      @users = User.all.map{|u| [u.username, u.id]}
      @models = Model.all.map{|m| [m.name, m.name]}
      @types = Type.all.map{|t| [t.name, t.name]}
      @brands = Brand.all.map{|t| [t.name, t.name]}
      @years = (1945..Time.new.year).to_a.map{|y| [y, y]}
    end

    def choice_condition
      @condition = [
                      "Used",
                      "New",
                      "Classic"
                    ]
    end

    def choice_status
      @choice_status = [ "true", "false"]
    end

    def product_params
      params.require(:sparepart).permit(:condition,:name,:category_id,:description,:province,:city,:brand,:model, :fuel, :status,
                        :transmission,:year,:type_product,:color, :price,:negotiable, :location, :cylinders,
                        images_attributes: [:id,:image,:_destroy])
    end
end