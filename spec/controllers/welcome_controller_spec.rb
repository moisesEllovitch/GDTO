require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

	context "Working Static pages" do

		it "It should open index page" do
			get :index
			expect(response).to render_template :index
		end
		it "It should open about page" do
			get :about
			expect(response).to render_template :about
		end
		it "It should open contact page" do
			get :contact
			expect(response).to render_template :contact
		end

	end	
end
