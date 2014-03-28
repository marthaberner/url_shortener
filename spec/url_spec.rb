require 'spec_helper'
require 'capybara/rspec'
require_relative '../url'

Capybara.app = Url


feature "URL shortener" do
  scenario "user visits homepage" do

    visit "/"
    expect(page).to have_field "enter a url to be shortened here"
    expect(page).to have_button "shorten"
  end

  scenario "user submits url to be shortened and old url and new heroku url are displayed" do
    visit "/"
    fill_in "url", with: "wwww.testurl.com"
    click_on "shorten"
    expect(page).to have_content "www.testurl.com"
    expect(page).to have_content "http://radiant-atoll-4289.herokuapp.com/0"
    save_and_open_page


  end
end




