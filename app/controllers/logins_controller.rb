class LoginsController < ApplicationController
  
  def create
  	user = User.find_by_email params[:logins][:email]
  	if user.authenticate(params[:logins][:password])
  		log_in(user)
      params[:logins][:remember_me]=='1' ? remember : forget
  		redirect_to '/'
  	else
  		flash[:danger]="Email and/or password incorrect"
  		redirect_to '/login'
  	end
  end

  def destroy
  	log_out(current_user)
  	redirect_to :root
  end
end
