require 'spec_helper'

describe "Static Pages" do

  describe "Home Page" do
    
    it "is routed" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      # expect(response.status).to eq(200)
    end

    it "has correct title" do
    	visit root_path
    	expect(page).to have_content('CoA CS')
    end

  end
end
