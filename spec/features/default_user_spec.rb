# frozen_string_literal: true

require 'rails_helper'
require './spec/features/funtion_helper.rb'
include Warden::Test::Helpers

feature 'User' do
  scenario 'Open main page' do
    visit '/ads/'
    expect(page).to have_content I18n.t('ads.index.heading')
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
