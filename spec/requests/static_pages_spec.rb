require 'spec_helper'

describe "Static Pages" do

  let(:base_title) { "Case Tracker" }
  let(:search_link_text) {"Search"}

  subject { page }

  shared_examples_for "all static pages" do 
    
    before  { visit the_path }
    
    specify { expect(page).to have_selector('h1', text:  heading) }
    specify { expect(page).to have_title(page_title)}
    specify { expect(page).to have_selector(:link_or_button, text: search_link_text) }
    specify { expect(page).to have_content('Copyright') }

    # it "should have nonsense link (only in search page for test)" do
    #   click_link "Nonsense"   
    # end

    it "should have Logo link" do 
      click_link "Case Tracker"
      expect(page).to have_title(full_title(''))
    end

    it "should have working Home link" do
      click_link "Home"
      expect(page).to have_title(full_title('Home'))
    end

    it "should have working Search button link" do
      click_link(search_link_text)
      expect(page).to have_title(full_title('Search'))
    end

    it "should have working About link" do
      click_link "About"
      expect(page).to have_title(full_title('About Us'))
    end

    it "should have working Help link" do
      click_link "Help"
      expect(page).to have_title(full_title('Help'))
    end

    it "should have working Contacts link" do
      click_link "Contacts"
      expect(page).to have_title(full_title('Contacts'))
    end

  end

  context "Home page" do
    let(:the_path)   { root_path }
    let(:heading)    { 'Welcome to the Case Tracker' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
  end

  context "Search page" do
    let(:the_path)   { search_path }
    let(:heading)    { 'Search' }
    let(:page_title) { heading }
    it_should_behave_like "all static pages"
  end

  context "Help page" do
    let(:the_path)   { help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { heading }
    it_should_behave_like "all static pages"
  end

  context "About page" do
    let(:the_path)   { about_path }
    let(:heading)    { 'About' }
    let(:page_title) { heading }
    it_should_behave_like "all static pages"
  end

  context "Contacts page" do
    let(:the_path)   { contacts_path }
    let(:heading)    { 'Contacts' }
    let(:page_title) { heading }
    it_should_behave_like "all static pages"
  end

  context "Admin page" do
    let(:the_path)   { admin_path }
    let(:heading)    { 'Administration' }
    let(:page_title) { heading }
    it_should_behave_like "all static pages"
  end

end 