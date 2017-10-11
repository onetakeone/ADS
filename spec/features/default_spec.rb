require 'rails_helper'
require './spec/features/funtion_helper.rb'
include Warden::Test::Helpers

feature 'User' do
  scenario 'Open main page' do
    visit '/ads/'
    expect(page).to have_xpath("/html/body/hh")
  end

  scenario 'sign in as user' do
    user_sign_in
  end

  scenario 'create ad' do
    user_sign_in
    create_ad
  end

  scenario 'edit ad' do
    user_sign_in
    create_ad
    edit_ad
  end
end

feature 'Admin' do
  scenario 'sign in as admin' do
    admin_sign_in
  end

  scenario 'edit user role' do
    admin_sign_in
    edit_role
  end

  scenario 'edit ad state' do
    user_sign_in
    create_ad    
    click_on 'logout'
    admin_sign_in
    admin_edit_state    
  end
end
