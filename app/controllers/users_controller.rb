class UsersController < ApplicationController
	def new
  		@user = User.new
  		@role = params[:role]
	end

  def show
    @user = User.find(params[:id])
    @username = @user["username"]
  end

	def create
  		@user = User.new(user_params)
  		if @user.save
        UserMailer.welcome_email(@user).deliver_now
        redirect_to action: "show", id: @user["id"]
  		else
        render "new"
  		end
	end

  
	private
  	## Strong Parameters 
  	def user_params
    	params.require(:user).permit(:email, :password, :password_confirmation, :role, :username, :skype, :description, :photo)
  	end
end
