class ProductsController < UsersController
	layout 'application_user'
	before_action :set_product, except: [:index, :archive,:new,:create]
	before_action :generate_select, except: [:index, :archive,:destroy,:change_status]
	def index
		@products = current_user.products.where('status = TRUE').page(params[:page])
	end
	
	def archive
		@products = current_user.products.where('status = FALSE').page(params[:page])
	end

	def new
		@product = Product.new
		render layout: 'application_home'
	end

	def edit
		render layout: 'application_home'
	end

	def create
		@product = current_user.products.new(product_params)
		if @product.save
			flash[:notice] = 'Your Product Created'
			redirect_to products_path
		else
			flash[:alert] = @product.errors.full_messages
			redirect_to new_product_path
		end
	end

	def update
		debugger
		if @product.update(product_params)
			flash[:notice] = 'Your Product Changed'
			redirect_to products_path
		else
			flash[:alert] = @product.errors.full_messages
			redirect_to edit_product_path(@product)
		end
	end

	def change_status
		if @product.update({status: !@product.status})
			flash[:notice] = 'Status Has Changed'
		else
			flash[:errors] = @product.errors.full_messages
		end
		redirect_to :back
	end

	def destroy
		if @product.delete
			flash[:notice] = 'Your Product Has Deleted'
		else
			flash[:errors] = @product.errors.full_messages
		end		
		redirect_to :back
	end

	def mass_actions
		@products = current_user.products.find(params[:product_ids])
		if params[:select_actions] == '1'
			@products.map{|prod| prod.update(status: !prod.status)}
			flash[:notice] = "Products Has Changed Status"
		elsif params[:select_actions] == '2'
			@products.map{|prod| prod.delete}
			flash[:notice] = "Products Has Deleted"
		end
		redirect_to :back
	end

	private
		def set_product
			@product = current_user.products.find_by!(params[:product_id])
		end

	    def generate_select
	      @models = Model.all.map{|m| [m.name, m.name]}
	      @types = Type.all.map{|t| [t.name, t.name]}
	      @brands = Brand.all.map{|t| [t.name, t.name]}
	      @years = (1945..Time.new.year).to_a.map{|y| [y, y]}
	      colors = ['Black','Red','White','Blue','Silver','Pink','Gray','Metalic','Silver Stone','Green',
	        'Yellow','Purple','Maroon']
	      @colors = colors.map{|c| [c,c]}
	      @transmissions = ['Auto','Mechanic'].map{|tr| [tr,tr]}
	    end

	    def product_params
	      params.require(:product).permit(:condition,:name,:category_id,:description,:province,:city,:brand,:model, :fuel, :status,
	      									:transmission,:year,:type_product,:color, :price,:negotiable, :location, :cylinders,
	      									images_attributes: [:id,:image,:_destroy])
		end

end