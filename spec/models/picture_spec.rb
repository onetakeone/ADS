# frozen_string_literal: true

require 'rails_helper'

describe Picture do
  describe 'assosiations' do
    it { should belong_to(:ad) }
  end
end
