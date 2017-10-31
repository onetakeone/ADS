# frozen_string_literal: true

# Admin methods
#
def admin_sign_in
  visit new_user_session_path
  admin = FactoryGirl.create(:admin)
  login_as(admin)
end

def edit_role
  visit users_path
  expect(page).to have_content I18n.t('users.index.heading')
  first('td').click_link(I18n.t('users.index.edit'))
  expect(page).to have_content I18n.t('users.edit.heading')
  select 'guest', from: 'Role'
  click_on I18n.t('layout.save')
  expect(page).to have_content I18n.t('users.index.heading')
end

def admin_edit_state
  visit users_path
  click_on 'Draft'
  expect(page).to have_content I18n.t('ads.edit.heading')
  select 'new', from: 'State'
  click_button I18n.t('layout.save')
  expect(page).to have_content 'New'
end

# User methods
#
def user_sign_in
  visit new_user_session_path
  user = FactoryGirl.create(:user)
  login_as(user) # Sign in via Warden helper login_as
end

def create_ad
  type = FactoryGirl.create(:type)
  visit new_ad_path
  select type.ad_type, from: 'Type'
  fill_in 'Title', with: Faker::Lorem.word
  fill_in 'Advert', with: Faker::Lorem.sentence
  click_button I18n.t('layout.save')
  expect(page).to have_content I18n.t('ads.notice.created')
end

def edit_ad
  click_on 'Edit'
  expect(page).to have_content I18n.t('ads.edit.heading')
  select 'new', from: 'State'
  click_button I18n.t('layout.save')
  expect(page).to have_content I18n.t('ads.notice.updated')
end
