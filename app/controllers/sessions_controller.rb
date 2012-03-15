class SessionsController < ApplicationController
 
  def new
    @title = "Sign in"
  end
  
  def create
   user = User.authenticate(params[:session][:email],
                            params[:session][:password])
              
    if user.nil?
      @title = "Sign in"
      flash.now[:error] = "Invalide email/password combination."
      render 'new'
    else
      #Handel successful
    end  
  end
  
  def destroy
    @title = "Sign out"
  end
end
