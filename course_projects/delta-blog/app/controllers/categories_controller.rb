class CategoriesController < ApplicationController
    before_action :set_category, only: [:show,:edit,:update]
    before_action :require_admin, except: [:index,:show]
    
    def index
      @categories = Category.paginate(page: params[:page], per_page: 5)
    end
    def new
        @category= Category.new
    end
    def edit; end
    def update
      if @category.update(category_params)
        redirect_to category_url(@category), notice: "Category was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
     end
    def show
      @articles = @category.articles.paginate(page: params[:page], per_page: 5)
    end
    def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_url(@category), notice: "Category was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
    end
    private 
    def set_category
      @category = Category.find(params[:id])
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
    def require_admin
      if !(logged_in? && current_user.admin?)
        flash[:alert] = "Only admins can do this."
        redirect_to categories_path
      end
    end 
end