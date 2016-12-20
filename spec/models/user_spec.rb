require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe User, type: :model do

	before(:each) do
		@user = User.create(email: "email@test.com", password_digest: "ppppp")
	end

	context "Valid User" do
		it "should not allow to be created without an email" do
			@user.email = nil
			expect(@user).to_not be_valid # funciona
		end

		# the same of above, but with Shoulda Matchers
		it { should validate_presence_of(:email) }

		it "should not allow to be created without a password" do
			@user.password_digest = nil
			expect(@user).to_not be_valid	# Não sei pq esse não funciona!!! 		
		end

		# the same of above, but with Shoulda Matchers
		it{should validate_presence_of(:password_digest)}

		it "should have at least 5 chars in password (RSPEC)" do
			@user.password_digest = "aaaa"
			expect(@user).to_not be_valid
		end

		# the same of above, but with Shoulda Matchers
		it "Should have at leat 5 chars in password (Shoulda MATCHERS)" do
           should validate_length_of(:password_digest).is_at_least(5)
		end

		it { should validate_uniqueness_of(:email)}
	end
end
