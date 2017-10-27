# frozen_string_literal: true

#
require 'rails_helper'
require './spec/features/funtion_helper.rb'
include Warden::Test::Helpers

feature 'Admin' do
  scenario 'signs in as admin' do
    admin_sign_in
  end

  scenario 'edits user role' do
    FactoryGirl.create(:user)
    admin_sign_in
    edit_role
  end

  scenario 'edits advert state' do
    user_sign_in
    create_ad
    click_on I18n.t('layout.header.logout')
    admin_sign_in
    admin_edit_state
  end
end
