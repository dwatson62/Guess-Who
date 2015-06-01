require_relative 'spec_helper'

describe Crowd do

  context 'Creation' do

    it 'should be able to create a crowd' do
      crowd = Crowd.create()
      expect(Crowd.count).to eq(1)
    end
  end
end