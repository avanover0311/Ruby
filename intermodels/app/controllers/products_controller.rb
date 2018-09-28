class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def create
  	@products =Product.create(name: params[:name])
  	redirect_to '/products'

  		if @products.save
  			flash[:success] = "New has been created"
  		else
  			flash[:danger] = "You missed something- try again"
  		end
  	end	
  	def show
  		@products=Product.find(params[:id])
  	end
  	def edit
  		@products=Product.find(params[:id])
  	end
  	def update
  		product= Product.find(params[:id])
  		product.name = params[:name]
  		product.save
  		redirect_to '/products'
  	end
  	def delete
  		product= Product.find(params[:id])
  		product.destroy
  		redirect_to '/products'
  	end
end
