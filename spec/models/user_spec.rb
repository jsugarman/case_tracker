require 'spec_helper'

describe User do

	before { @user = User.new(name: "Example User", email: "user@example.com") }
	subject { @user }

  	describe "a valid user" do
		specify { expect(subject).to respond_to(:name) }
		specify { expect(subject).to respond_to(:email) }
		specify { expect(subject).to respond_to(:password_digest) }
		specify { expect(subject).to be_valid }
	end

	describe "an invalid user" do
		
		context "with no name" do
			before { @user.name = '' }
			# it { should_not be_valid }
			specify { expect(subject).to_not be_valid }
		end

		context "with too short a name" do
			before { @user.name = 'j' }
			specify { expect(subject).to_not be_valid }
		end

		context "too long a name" do
			before { @user.name = 'j'*129 }
			specify { expect(subject).to_not be_valid }
		end

		context "with no email" do
			before { @user.email = '' }
			specify { expect(subject).to_not be_valid }
		end

		context "with invalid format of email" do
			before { @user.email = 'invalidemailaddress.com' }
			specify { expect(subject).to_not be_valid }
		end

		context "with duplicate email" do
			before do
				user_with_same_email = @user.dup
				user_with_same_email.name = 'different name'
				user_with_same_email.save
			end
			specify { expect(subject).to_not be_valid }
		end


		pending "create more robust invalid mail format test using factories??!"

	# pending "should have email confirmation virtua field when creating???not creating though"


	end


	pending "should have a login password"

	
	pending "should not be able to create a new user"
	pending "should be able to view other admins, if you are an admin"

end
