module LoginsHelper

	# stores user in the session
	def log_in(user)
		session[:user_id]=user.id
	end

	def log_out(user)
		session.delete(:user_id)
		forget
		@current_user = nil
	end

	# Remembering the user involves the following...
	# 1) generating a token and saving a digest version of it
	# 2) setting this token in a permanent cookies
	def remember
		current_user.remember
		cookies.permanent[:remember_token]=current_user.remember_token
		cookies.permanent.signed[:user_id]=current_user.id
	end

	def forget
		current_user.forget if current_user
		cookies.delete(:remember_token)
		cookies.delete(:user_id)
	end	

	def logged_in?
		current_user.present?
	end

	def current_user
		return @current_user if @current_user
		if (user_id = session[:user_id])
			@current_user = User.find user_id
		elsif (user_id = cookies.signed[:user_id])
			user = User.find user_id
			if user && user.authenticate_token(cookies[:remember_token])
				log_in(user)
				@current_user = user
			end
		end
	end
end
