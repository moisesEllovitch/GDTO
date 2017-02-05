class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_categories
  before_action :set_items
  before_action :store_tecnologies

	def authorize
		unless logged_in?
			redirect_to login_path, :notice => "You need to register an account...."			
		end
	end

	def authorize_admin
		unless logged_in? && current_user.admin?
			redirect_to login_path, :notice => "Only admins can do it!"
		end
	end

	def correct_user?
		@user = User.find(params[:id])
		unless current_user == @user
			redirect_to users_path, :notice => "You are not the correct user."
		end
	end

	private
	
	def set_items
		@items = Item.all
	end

	def set_categories
		@categories = Category.all
	end

	def store_tecnologies
		@tecnologies = Array["Ruby on Rails","HTML5", "CSS", "SCSS", "Bootstrap", "MySql", 
			"Javascript", "JQuery", "Git", "Tests - RSpec", "Shoulda Matchers", "Heroku"]
	end

end
