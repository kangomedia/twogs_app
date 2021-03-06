require 'spec_helper'

describe "User pages" do
  
  subject { page }
  
  describe "signup page" do
    before { visit new_user_path }
    it { should have_content('2GS') }
    #it { should have_content("Add a User") }
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_link('Sign In', signin_path) }
    #it { should have_content(user.name) }
  end
  
  describe "add new user" do
    before { visit new_user_path }
    let(:submit) { "Add User" }
    
    describe "with invalid information" do
      it { should have_link('Sign In', signin_path) }
      # it "should not create a user" do
      #         expect { click_button submit }.not_to change(User, :count)
      #       end
    end
    
    # describe "with valid information" do
    #       before do
    #         fill_in "Name",         with: "Example User"
    #         fill_in "Username",     with: "exampleuser"
    #         fill_in "Password",     with: "foobar"
    #         fill_in "Confirmation", with: "foobar"
    #       end
    #       
    #       it "should create a user" do
    #         expect { click_button submit }.to change(User, :count).by(1)
    #       end
    #       
    #       # describe "after saving the user" do
    #       #         before { click_button submit }
    #       #         let(:user) { User.find_by(username: 'exampleuser') }
    #       #         
    #       #         it { should have_link('Sign Out') }
    #       #         it { should have_content(user.name) }
    #       #         it { should have_selector('div.alert.alert-success', text: 'You') }
    #       #       end
    #     end
  end
  
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user 
      visit edit_user_path(user)
    end
    
    describe "page" do
      it { should have_content("Update Your Profile") }
    end
    
    describe "with invalid information" do
      before { click_button "Save Changes" }
      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_name)      { "New Name" }
      let(:new_username)  { "newusername" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Username",         with: new_username
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save Changes"
      end
      
      it { should have_content(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign Out', href: signout_path) }
      specify { expect(user.reload.name).to eq new_name }
      specify { expect(user.reload.username).to eq new_username }
    end
  end
end