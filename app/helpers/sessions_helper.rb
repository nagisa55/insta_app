module SessionsHelper
	def current_user
		if session[:user_id] 
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end	

	def logged_in?
		!!current_user
	end

	def current_user?(user)
    user == current_user
	end
	
	def correct_user
		@user = User.find(params[:id])
	 redirect_to root_path	unless current_user?(@user)
	end 
end
