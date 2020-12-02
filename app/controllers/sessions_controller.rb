class SessionsController < ApplicationController

    def index

    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new

    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Invalid login credentials. Please try again."
            redirect_to login_path
        end
    end

    
end