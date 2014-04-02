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
    fill_in "url", with: "http://www.google.com"
    click_on "Shorten"
    expect(page).to have_content "http://www.google.com"
    this_path = current_path.to_s
    expect(page).to have_content this_path
  end

  scenario "user visits shortened URL and is redirected to original URL" do
    visit "/"
    fill_in "url", with: "http://www.google.com"
    click_on "Shorten"
    visit (current_path)
    expect(page.current_url).to eq('http://www.google.com/')
  end
end

