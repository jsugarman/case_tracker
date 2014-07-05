require 'spec_helper'

describe User do
  
	before { @user = User.new(name: "Example User", email: "user@example.com") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }

	pending "should have a login password"
	pending "name must be provided" 
	pending "email must be provided and be valid" 

end
