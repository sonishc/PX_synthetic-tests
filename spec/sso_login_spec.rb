require 'spec_helper'

describe "SSO login page" do
  before :each do
    visit "/"
  end

  context 'when used Cloud Foundry SSO login' do
    it 'sso login' do
      sso_login_step

      expect(page).to have_content "Dashboard"
      expect(page).to have_content ENV['USER_EMAIL']
    end
  end

  private

  def sso_login_step
    click_link('Log In with Predix SSO')
    fill_in 'email', :with => ENV['USER_EMAIL']
    click_button('Next')
    fill_in 'password', :with => ENV['USER_PASSWORD']
    click_button('Sign in')
  end
end
