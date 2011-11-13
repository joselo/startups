require 'spec_helper'

describe Startup do
  let(:startup){ Factory(:startup) }

  context 'validations' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:twitter) }
    it { should validate_presence_of(:url) }

    it{ should ensure_length_of(:description).is_at_most(Startup::MAX_DESCRIPTION) }

    it{ should validate_format_of(:url).
                with( Factory.next(:url) )}
    it{ should_not validate_format_of(:url).
                with("http//www").
                with_message(I18n.t("activerecord.errors.models.startup.attributes.url.invalid")) }

    describe 'MAX_DESCRIPTION' do
      it 'should be equals to 50' do
        Startup::MAX_DESCRIPTION.should == 1000
      end
    end
  end

  context 'callbacks' do
    describe '#set_permalink' do
      it 'should receive permalink after save' do
        startup = Factory.build(:startup)
        startup.should_receive(:set_permalink).and_return(true)
        startup.save
      end
    end
  end

  describe '#to_param' do
    it 'should return the name' do
      startup.to_param.should == "#{startup.id}-#{startup.permalink}"
    end
  end

  describe '.latest' do
    it 'should return the last startups' do
      startup1 = Factory(:startup)
      startup2 = Factory(:startup)
      Startup.all.size
      Startup.latest.should == [startup2, startup1]
    end
  end

end