# frozen_string_literal: true

#
require 'rails_helper'
require './spec/features/user_funtion_helper.rb'
include Warden::Test::Helpers

feature 'User' do
  scenario 'opens main page' do
    visit '/ads/'
    expect(page).to have_content I18n.t('ads.index.heading')
  end

  scenario 'signs in as user' do
    user_sign_in
  end

  scenario 'creates new advert' do
    user_sign_in
    create_ad
  end

  scenario 'edits existing advert' do
    user_sign_in
    create_ad
    edit_ad
  end
end
