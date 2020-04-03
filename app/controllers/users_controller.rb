class UsersController < ApplicationController

    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        binding.pry
        # if @user.save
        #     session[:user_id] = @user.user_id
        #     redirect_to user_path
        # else
        #     render :new
        # end
    end
    
    def show
        redirect_unless_logged_in
        @user = User.find_by(id: params[:id])
        redirect_to root_path if @user != current_user
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :email, :password)
    end
    
end