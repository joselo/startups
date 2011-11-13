require 'spec_helper'

describe User do
  let(:subject){ Factory(:user) }

  context 'validations' do
    it{ should have_many(:startups) }
  end

  describe '#new_startup' do
    it 'should return a new instance of startup' do
      subject.new_startup.should be_new_record
    end
  end

  describe '#find_startup' do
    it 'should find a startup that belongs to the user' do
      startup = Factory(:startup, :user => subject)
      subject.find_startup(startup.to_param).should == startup
    end
  end

  describe "#has_startups?" do
    it 'should return true' do
      startup = Factory(:startup, :user => subject)
      subject.has_startups?.should be_true
    end

    it 'should return false' do
      subject.has_startups?.should be_false
    end
  end

end