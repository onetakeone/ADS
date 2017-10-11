require 'rails_helper'
include ActiveModel::Validations

describe Ad do
  before :each do
    @type = FactoryGirl.create(:type)
    @ad = FactoryGirl.create(:ad)
  end

  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:body)}
    it { should validate_length_of(:title).is_at_most(150) }
    it { should validate_length_of(:body).is_at_most(4000) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:type) }
    it { should have_many(:pictures) }
  end

  describe 'states' do      
    it { should have_states :draft, :new, :denied, :verified, :deleted, :archieved, :published }

    describe 'Draft state events' do
      it { should be_draft }
      it { should handle_events :create, when: :draft }      
      it 'should change to :new on :create' do
        @ad.create!
        @ad.should be_new
      end
    end

    describe 'New state events' do
      it { should handle_events :deny, when: :new }
      it 'should change to :denied on :deny' do
        @ad.state = 'new'
        @ad.deny!
        @ad.should be_denied
      end
   
      it { should handle_events :verify, when: :new }
      it 'should change to :verified on :verify' do
        @ad.state = 'new'
        @ad.verify!
        @ad.should be_verified
      end
   
      it { should handle_events :kick, when: :new }    
      it 'should change to :deleted on :kick' do
        @ad.state = 'new'
        @ad.kick!
        @ad.should be_deleted
      end
    end

    describe 'Verified state events' do
      it { should handle_events :publish, when: :verified } 
      it 'should change to :published on :publish' do
        @ad.state = 'verified'
        @ad.publish!
        @ad.should be_published
      end

      it { should handle_events :kick, when: :verified }
      it 'should change to :deleted on :kick' do
        @ad.state = 'verified'
        @ad.kick!
        @ad.should be_deleted
      end
    end

    describe 'Published state events' do
      it { should handle_events :archieve, when: :published }
      it 'should change to :archieved on :archieve' do
        @ad.state = 'published'
        @ad.archieve!
        @ad.should be_archieved
      end
    end

    describe 'Archieved state events' do
      it { should handle_events :resurrect, when: :archieved }
      it 'should change to :draft on :resurrect' do
        @ad.state = 'archieved'
        @ad.resurrect!
        @ad.should be_draft
      end
    end   
  end
end

# it { is_expected.to transition_from :archieved, to_state: :draft, on_event: :ressurect } - why doesn't work ?   