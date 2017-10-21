require 'rails_helper'
require './spec/features/funtion_helper.rb'
include Warden::Test::Helpers

feature 'Filter' do
  scenario 'shows ad' do
    FactoryGirl.create(:writer)
    FactoryGirl.create(:type)
    FactoryGirl.create(:wts)
    visit '/ads/'
    fill_in :search, with: 'wts'
    click_on 'Search'
    expect(page).to have_content 'Test_Filter'
  end

  # scenario 'current user ads' do
  #   FactoryGirl.create(:writer_two)
  #   FactoryGirl.create(:type)
  #   FactoryGirl.create(:wts_one)
  #   FactoryGirl.create(:wts_two)
  #   visit new_user_session_path
  #   user = FactoryGirl.create(:writer_one)
  #   login_as(user)
  #   visit '/ads/'
  #   click_on I18n.t('ads.index.filter.myads')
  #   expect(page).to have_no_content 'writer2'
  #   expect(page).to have_content 'writer1'
  # end
end
