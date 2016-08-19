class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_items

	def authorize
		unless logged_in?
			redirect_to login_path, :notice => "You need to register an account...."			
		end
	end

	def authorize_admin
		unless current_user.admin?
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

#Estou tentando ir para index de items, filtrado por categoria. Achei este código.
=begin	def get_items(category)
	    items = category.items.to_a
	    category.subcategories.each do |sub|
	      items << get_items(sub)
	    end

	    items
	end
=end


#ou esse: http://stackoverflow.com/questions/17685103/filtering-products-in-index-of-categories-products-by-products-attribute
end
