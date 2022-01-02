class SessionsController < ApplicationController

    def new
    end
    def create
        # user = User.find_by(email: params[:session][:email].downcase)
        # if user && user.authenticate(params[:session][:password])
        #     session[:user_id] = user.id
        #     flash[:notice] = "Logged In Successfully"
        #     redirect_to user
        # else
        #     flash.now[:alert] = "There was something wrong with your login info."
        #     render turbo_stream: turbo_stream.update("flash",partial:"layouts/messages")
        # end 
    end
    def destroy 
        # session[:user_id] = nil
        # flash[:notice] = "Logged Out Successfully"
        # redirect_to articles_path
    end
end
