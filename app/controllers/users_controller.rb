class UsersController < ApplicationController

    before_action :redirect_if_logged_in, only: [:new]
    before_action :redirect_unless_logged_in, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
        redirect_to root_path if @user != current_user
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :email, :password)
    end
    
end