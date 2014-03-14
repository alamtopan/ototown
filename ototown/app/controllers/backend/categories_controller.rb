class Backend::CategoriesController < Backend::ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new    
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'category was successfully saved'
      redirect_to backend_category_path(@category)
    else
      render action: 'new'
    end
  end

  def show
    
  end

  def edit    
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'category was successfully updated'
      redirect_to edit_backend_category_path(@category)
    else
      render action: 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'category was successfully removed'
    else
      flash[:error] = 'Failed to remove category'
    end

    redirect_to backend_categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name )
    end
    
end