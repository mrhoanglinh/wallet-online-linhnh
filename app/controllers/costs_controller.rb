class CostsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_cost, only: [:show, :edit, :update, :destroy]

	def index
	  @costs = Cost.all.page(params[:page]).per(5)	
	end

	def show
	end

	def new
	  @cost = Cost.new
	end

	def create
	  @cost = Cost.new(cost_params)
	  if @cost.save
		redirect_to costs_path, :notice => "Cost has been saved!"
	  else
		render "new"
	  end	
    end

	def edit		
	end

	def update		
	  if @cost.update_attributes(cost_params)
		redirect_to costs_path, :notice => "Cost has been updated!"
	  else
		render "edit"
	  end
	end

	def destroy		
	  @cost.destroy
	  redirect_to costs_path, :notice => "Cost has been delete!"
	end

	private
	  def set_cost
	    @cost = Cost.find(params[:id])    
	  end

	  def cost_params
	    params.require(:cost).permit(:amount, :created_at, category_ids: [])
	  end
end