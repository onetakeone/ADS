require 'rails_helper'

describe Type do   
  describe 'assosiations' do  
    it { should have_many(:ads) }
  end
end 