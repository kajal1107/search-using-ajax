class UsersController < ApplicationController
	def index
		@users = User.all
	end

  def search
    @users = User.search(params[:search], params[:option_type])
    respond_to do |format|
      format.js
    end
  end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def destroy
		@user = User.find(params[:id])
  	@user.destroy
  	
  	redirect_to root_path
  end

	private
		def user_params
			params.require(:user).permit(:user_name, :email, :phone, addresses_attributes: [:id, :address, :street_number, :locality, :route, :administrative_area_level_1, :country, :postal_code, :_destroy])
		end
end
