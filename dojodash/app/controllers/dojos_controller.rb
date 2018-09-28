class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  end

  def create
  	@dojo =Dojo.create(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
  	redirect_to '/dojos'

  	if @dojo.save
  		flash[:success] = "New Dojo has been created"
  	else
  		flash[:danger] = "You missed something- try again"
  	end
  end	

  def show
  	@dojos=Dojo.find(params[:id])
    @students=Dojo.find(params[:id]).students

  end

  def edit
  	@dojo=Dojo.find(params[:id])
  end
  def update
  	dojo= Dojo.find(params[:id])
  	dojo.branch = params[:branch]
  	dojo.street = params[:street]
  	dojo.city = params[:city]
  	dojo.state = params[:state]
  	dojo.save
  	redirect_to '/dojos'
  end
  def delete
  	dojo= Dojo.find(params[:id])
  	dojo.destroy
  	redirect_to '/dojos'
  end
end
