# frozen_string_literal: true

#
require 'rails_helper'
include Warden::Test::Helpers

feature 'Filter' do
  scenario 'retrieves advert matching to the query' do
    @ads = FactoryGirl.create_list(:published, 2)
    visit '/ads/'
    fill_in 'search', with: @ads[1][:title]
    click_on 'search_button'
    expect(page).to have_content @ads[1][:title]
    expect(page).to have_no_content @ads[0][:title]
  end

  scenario 'retrieves advert matching to the type' do
    FactoryGirl.create(:type, ad_type: 'type', id: 1)
    searchable_ad = FactoryGirl.create(:published, type_id: 1)
    secondary_ad = FactoryGirl.create(:published)
    visit '/ads'
    check 'type'
    click_on 'search_button'
    expect(page).to have_content searchable_ad.body
    expect(page).to have_no_content secondary_ad.body
  end

  scenario 'sorts adverts by title' do
    FactoryGirl.create(:published, title: 'AAA')
    FactoryGirl.create(:published, title: 'BBB')
    FactoryGirl.create(:published, title: 'CCC')
    visit '/ads'
    click_on 'Title'
    expect(page).to have_text /AAA.+BBB.+CCC/
    click_on 'Title'
    expect(page).to have_text /CCC.+BBB.+AAA/
  end
end
