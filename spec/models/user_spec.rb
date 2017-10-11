require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end

  describe 'assosiations' do
    it { should have_many(:ads) }
  end

  describe 'uniqueness' do
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  it { should enumerize(:role).in(:guest, :user, :admin).with_default(:guest) }
end
