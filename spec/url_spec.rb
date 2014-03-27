require 'spec_helper'
require 'capybara/rspec'
require_relative '../url'

Capybara.app = Url


feature "URL shortener" do
  scenario "user visits homepage" do

    visit "/"

  end
end




