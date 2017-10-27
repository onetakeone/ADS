# frozen_string_literal: true

require 'rails_helper'
include ActiveModel::Validations

describe Ad do
  before do
    @ad = FactoryGirl.create(:ad)
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:title).is_at_most(150) }
    it { should validate_length_of(:body).is_at_most(4000) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:type) }
    it { should have_many(:pictures) }
  end
end
