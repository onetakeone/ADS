require 'rails_helper'
require './spec/features/funtion_helper.rb'
include Warden::Test::Helpers

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
    click_on I18n.t('layout.header.logout')
    admin_sign_in
    admin_edit_state
  end
end
