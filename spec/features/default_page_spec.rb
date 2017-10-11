# require "rails_helper"
# include Warden::Test::Helpers

# feature "default" do
#   scenario "default" do
#     visit '/ads/'
#       expect(page).to have_xpath("/html/body/hh")
#     sign_in
#     visit '/ads/new'
#       type_in
#       fill_in 'Title', with: 'Title-test'
#       fill_in 'Advert', with: 'Advert-test'
#       click_button 'done'
#       expect(page).to have_content 'created'
#   end
# end

# #sign in via Warden helper login_as
# def sign_in
#   visit new_user_session_path
#   user = FactoryGirl.create(:user)
#   login_as(user)
# end

# def type_in
#   type = FactoryGirl.create(:type)
#   select type.ad_type, :from => 'Type'
# end
