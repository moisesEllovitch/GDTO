class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			puts "Usuário está autenticado e válido."
			# redirect_to welcome_index_path, :notice => "Welcome #{user.email}"
			log_in user # chama a action na helper de session
			params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			#redirect_to user, :notice => "Welcome #{user.email}"
			redirect_to welcome_index_path, :notice => "Welcome #{user.email}"
		else
			puts "Usuário não está autenticado ou válido."
			redirect_to login_path, :notice => "Invalid email/password combination"
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end

end
