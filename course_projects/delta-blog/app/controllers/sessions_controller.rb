class SessionsController < ApplicationController

    def new
    end
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:notice] = "Logged In Successfully"
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong with your login info."
            render turbo_stream: turbo_stream.update("flash",partial:"layouts/messages")
        end 
    end
    def destroy 
    end
end
