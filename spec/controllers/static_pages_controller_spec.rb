require 'spec_helper'


# old style but left in for now. jsugarman 
describe StaticPagesController do

  describe "GET 'search'" do
    it "returns http success" do
      get 'search'
      response.should be_success
    end
  end

end
