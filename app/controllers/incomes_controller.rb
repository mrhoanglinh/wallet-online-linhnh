class IncomesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_income, only: [:show, :edit, :update, :destroy]

	def index
	  @incomes = Income.all.page(params[:page]).per(5)
	end

	def show   	
	end

	def new
 	  @income = Income.new
	end

	def create
	  @income = Income.new(income_params)
	  if @income.save
		redirect_to incomes_path, :notice => "Income has been saved!"
	  else
		render "new"
	  end	
    end

	def edit
	end

	def update		
	  if @income.update_attributes(income_params)
		redirect_to incomes_path, :notice => "Income has been updated!"
	  else
		render "edit"
	  end
	end

	def destroy		
	  @income.destroy
	  redirect_to incomes_path, :notice => "Income has been delete!"
	end

	private
	  def set_income
	  	@income = Income.find(params[:id])
	  end

	  def income_params
	    params.require(:income).permit(:amount, :created_at, category_ids: [])
	  end
end