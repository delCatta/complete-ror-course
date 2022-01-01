class CategoriesController < ApplicationController
    def index
    end
    def new
        @category= Category.new
    end
    def show
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
    def category_params
        params.require(:category).permit(:name)
      end
end
