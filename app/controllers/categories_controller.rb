class CategoriesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all.page(params[:page]).per(5)
	end

	def show		
	end

	def edit		
	end

	def update		
		if @category.update_attributes(category_params)
			redirect_to categories_path, :notice => "Category has been updated!"
		else
			render "edit"
		end
	end

	def new
		@category = Category.new
	end

	def create
		#@category = Category.new(category_params)
		@category = current_user.categories.new(category_params)
		if @category.save
			redirect_to categories_path, :notice => "Category has been saved!"
		else
			render "new"
		end
	end

	def destroy		
		@category.destroy
		redirect_to categories_path, :notice => "Category has been delete!"
	end

	private	  
	  def set_category
        @category = Category.find(params[:id])
      end
    
	  def category_params
	    params.require(:category).permit(:name)
	  end
end

