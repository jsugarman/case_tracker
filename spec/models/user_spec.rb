require 'spec_helper'

describe User do

	let(:user) { FactoryGirl.create(:user) } 

	# before { @user = User.new(name: "Example User", email: "user@example.com",
	 # password:"foobarish", password_confirmation: "foobarish") }
	subject { user }

  	describe "a valid user responds to name, email, password_digest, password and password_confirmation" do
		specify { expect(subject).to respond_to(:name) }
		specify { expect(subject).to respond_to(:email) }
		specify { expect(subject).to respond_to(:password_digest) }
		specify { expect(subject).to respond_to(:password) }
		specify { expect(subject).to respond_to(:password_confirmation) }
		specify { expect(subject).to be_valid }
	end

	describe "an invalid user" do
		
		context "with no name" do
			before { user.name = '' }
			specify { expect(subject).to_not be_valid }
		end

		context "with too short a name" do
			before { user.name = 'j' }
			specify { expect(subject).to_not be_valid }
		end

		context "with too long a name" do
			before { user.name = 'j'*129 }
			specify { expect(subject).to_not be_valid }
		end

		context "with no email" do
			before { user.email = '' }
			specify { expect(subject).to_not be_valid }
		end
		
		context "with invalid format of email" do
			before { user.email = 'invalid.Mixed.com' }
			specify { expect(subject).to_not be_valid }
		end

		pending "create more robust invalid mail format test using factories??!"
		
		context "with duplicate email" do
			# before do
				# @user_with_same_email = user.dup
				# user_with_same_email.name = 'different name'
				# @user_with_same_email.save
			# end
			# it { should_not be_valid }
			specify { expect(user.dup).to_not be_valid }
			# specify { expect(subject).to_not be_valid }
		end

		context "with no password digest" do
			before { user.password_digest = "" }
			specify { expect(subject).to_not be_valid }
		end

		context "with mismatched password and confirmation" do
			before { user.password_confirmation = "not_foobar" }
			specify { expect(subject).to_not be_valid }
		end

		context "with too short a password" do
			before { user.password = user.password_confirmation = 'a'*7 }
			specify { expect(subject).to_not be_valid }
		end

		pending "with password with one or more numbers or symbols"

	end


	describe "implicit data transformations" do

		let(:mixed_case_email) { "foo.BAR@wherever.COM" }
		
		specify "mixed email case converted to lower case" do

			user.email = mixed_case_email
			user.save
			expect(user.reload.email).to eq mixed_case_email.downcase
		end

	end

	describe "login password authentication" do
		before { user.save }
		let(:valid_user) {User.find_by(email: user.email)}

		context "with valid password" do
			specify { expect(valid_user.authenticate(user.password)).to be_true }	
		end

		context "with invalid password" do
			specify { expect(valid_user.authenticate('invalid')).to be_false }	
		end

	end

	pending "should have to login to get ot the admin page"	
	pending "should not be able to create a new user"
	pending "should be able to view other admins, if you are an admin"

end


