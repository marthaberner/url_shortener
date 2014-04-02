require 'spec_helper'
require 'capybara/rspec'
require_relative '../url'

Capybara.app = Url


feature "URL shortener" do
  scenario "user visits homepage" do

    visit "/"
    expect(page).to have_field 'Enter the URL you would like to "shorten"'
    expect(page).to have_button "Shorten"
  end

  scenario "user submits url to be shortened and old url and new heroku url are displayed" do
    visit "/"
    fill_in "url", with: "wwww.testurl.com"
    click_on "Shorten"
    expect(page).to have_content "www.testurl.com"
    expect(page).to have_content "/1"
  end
end




