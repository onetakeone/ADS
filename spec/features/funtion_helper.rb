def admin_sign_in
  visit new_user_session_path
  admin = FactoryGirl.create(:admin)
  login_as(admin) 
end

def admin_edit_state
  visit users_path
  click_on 'draft'
  expect(page).to have_content 'Editing Ad'
  select 'new', from: 'State'
  click_button 'done'
  expect(page).to have_content 'Ad was successfully updated'
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

def edit_role
  FactoryGirl.create(:user)
  visit users_path
  expect(page).to have_content 'MANAGE'
  find_link('EDIT', href: '/users/2/edit').click
  expect(page).to have_content 'EDIT USER'
  select 'guest', from: 'Role'
  click_on 'Set'
  expect(page).to have_content 'MANAGE'
end

def edit_ad
  click_on 'edit'
  expect(page).to have_content 'Editing Ad'
  select 'new', from: 'State'
  click_button 'done'
  expect(page).to have_content 'Ad was successfully updated'
end

def user_sign_in
  visit new_user_session_path
  user = FactoryGirl.create(:user)
  login_as(user) # Sign in via Warden helper login_as
end
