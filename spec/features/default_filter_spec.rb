# frozen_string_literal: true

#
require 'rails_helper'
require './spec/features/funtion_helper.rb'
include Warden::Test::Helpers

feature 'Filter' do
  scenario 'shows advert matching to the query' do
    @ads = FactoryGirl.create_list(:published, 2)
    visit '/ads/'
    fill_in 'search', with: @ads[1][:title]
    click_on 'search_button'
    expect(page).to have_content @ads[1][:title]
    expect(page).to have_no_content @ads[0][:title]
  end

  scenario 'show advert matching to the type' do
    @ada = FactoryGirl.create(:published)
    @adb = FactoryGirl.create(:published)
    visit '/ads'
    check @ada.type.ad_type
    # click_on "Search"
    expect(page).to have_content @ada.body
    # expect(page).to have_no_content @adb.body
  end
end
