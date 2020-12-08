class UsersController < ApplicationController

    def new 
        @user = User.new
        render :new
    end

    def create #signup
        @user = User.new(user_params)
        user = @user.save
        if user 
            login(@user)
            redirect_to bands_url
        else
            flash.new[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        render :show
    end

    private

    def user_params
        params.require(:user).require(:email, :password)
    end
end
