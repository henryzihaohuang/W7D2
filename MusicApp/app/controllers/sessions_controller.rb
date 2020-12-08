class SessionsController < ApplicationController

    def new 
        #usually @user = User.new
        render :new
    end

    def create #login
        user = User.find_by_credentials(
            params[:user][:email], params[:user][:password]
        )

        if user.nil?
            flash.now[:errors] = ["Incorrect username or password"]
            render :new
        else
            login(user)
            redirect_to bands_url
        end
    end

    def destroy
        logout_user!

        redirect_to new_session_url
        
    end



end
