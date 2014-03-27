require 'spec_helper'
require 'capybara/rspec'
require_relative '../url'

Capybara.app = Url


feature "URL shortener" do
  scenario "user visits homepage" do

    visit "/"
    expect(page).to have_field "explanatory placeholder text"
    expect(page).to have_button "shorten"
  end
end




