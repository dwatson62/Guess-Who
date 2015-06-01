require_relative 'spec_helper'

describe Crowd do

  context 'Creation of crowd' do

    it 'should be able to create a crowd' do
      expect(Crowd.count).to eq(0)
      crowd = Crowd.create()
      expect(crowd).to be_truthy
      expect(Crowd.count).to eq(1)
    end
  end
end