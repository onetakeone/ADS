require 'rails_helper'
include Warden::Test::Helpers

feature 'Default ' do
  scenario 'Open main page' do
    visit '/ads/'
    expect(page).to have_xpath("/html/body/hh")
  end

  scenario 'Sign in' do
    sign_in
  end

  scenario 'Create ad' do
    sign_in
    create_ad
  end

  scenario 'Edit ad' do
    sign_in
    create_ad
    edit_ad
  end
end

def sign_in
  visit new_user_session_path
  user = FactoryGirl.create(:user)
  login_as(user) # Sign in via Warden helper login_as
end

def create_ad
  type = FactoryGirl.create(:type)
  visit '/ads/new'
  select type.ad_type, from: 'Type'
  fill_in 'Title', with: 'Title-test'
  fill_in 'Advert', with: 'Advert-test'
  click_button 'done'
  expect(page).to have_content 'Ad was successfully created'
end

def edit_ad
  click_on 'edit'
  expect(page).to have_content 'Editing Ad'
  select 'new', from: 'State'
  click_button 'done'
  expect(page).to have_content 'Ad was successfully updated'
end
