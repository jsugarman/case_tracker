require 'spec_helper'

describe "Static Pages" do

  let(:base_title) { "Case Tracker" }
  let(:search_link_text) {"Search Cases Now"}

  subject {page}

  shared_examples_for "all static pages" do
    specify { expect(page).to have_selector('h1', text: heading) }
    specify { expect(page).to have_title(page_title)}
    specify { expect(page).to have_selector(:link_or_button, text: search_link_text) }
    specify { expect(page).to have_content('Copyright') }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Welcome to the Case Tracker' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
  end

  describe "Search page" do
    before {visit search_path}
    let(:heading)    { 'Search' }
    let(:page_title) { 'Search' }
    it_should_behave_like "all static pages"
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
  end

  describe "Contacts page" do
    before {visit contacts_path}
    let(:heading)    { 'Contacts' }
    let(:page_title) { 'Contacts' }
    it_should_behave_like "all static pages"
  end

  describe "Admin page" do
    before {visit admin_path}
    let(:heading)    { 'Administration' }
    let(:page_title) { 'Administration' }
    it_should_behave_like "all static pages"
  end

  # it "should have the right links on the layout" do
  #   visit root_path
  #   click_link "About"
  #   expect(page).to have_title(full_title('About Us'))
    
  #   click_link "Help"
  #   expect(page).to have_title(full_title('Help'))

  #   click_link "Contacts"
  #   expect(page).to have_title(full_title('Contacts'))

  #   click_link "Home"
  #   expect(page).to have_title(full_title(''))

  #   click_link "Search Cases Now!"
  #   expect(page).to have_title(full_title('Sign up'))
    
  #   click_link "sample app"
  #   expect(page).to have_title(full_title(''))
  # end

end