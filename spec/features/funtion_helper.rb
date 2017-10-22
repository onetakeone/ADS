# frozen_string_literal: true

def admin_sign_in
  visit new_user_session_path
  admin = FactoryGirl.create(:admin)
  login_as(admin)
end

def admin_edit_state
  visit users_path
  click_on 'Draft'
  expect(page).to have_content I18n.t('ads.edit.heading')
  select 'new', from: 'State'
  click_button I18n.t('layout.save')
  expect(page).to have_content I18n.t('ads.notice.updated')
end

def create_ad
  type = FactoryGirl.create(:type)
  visit '/ads/new'
  select type.ad_type, from: 'Type'
  fill_in 'Title', with: 'Title-test'
  fill_in 'Advert', with: 'Advert-test'
  click_button I18n.t('layout.save')
  expect(page).to have_content I18n.t('ads.notice.created')
end

def edit_role
  FactoryGirl.create(:user)
  visit users_path
  expect(page).to have_content I18n.t('users.index.heading')
  find_link(I18n.t('users.index.edit'), href: '/users/2/edit').click
  expect(page).to have_content I18n.t('users.edit.heading')
  select 'guest', from: 'Role'
  click_on I18n.t('layout.save')
  expect(page).to have_content I18n.t('users.index.heading')
end

def edit_ad
  click_on 'Edit'
  expect(page).to have_content I18n.t('ads.edit.heading')
  select 'new', from: 'State'
  click_button I18n.t('layout.save')
  expect(page).to have_content I18n.t('ads.notice.updated')
end

def user_sign_in
  visit new_user_session_path
  user = FactoryGirl.create(:user)
  login_as(user) # Sign in via Warden helper login_as
end
