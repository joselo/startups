require 'spec_helper'

describe HomeController do
  let(:startup){ Factory(:startup) }

  describe "#index" do

    before do
      Startup.should_receive(:latest).and_return([startup])
      get :index
    end

    it 'should assing variables' do
      assigns(:startups).should == [startup]
    end

    describe 'with rendered views' do
      render_views

      it 'should render index template' do
        response.should render_template :index
      end
    end

  end

  describe '#show' do

    before do
      Startup.should_receive(:find).with('foo').and_return(startup)
      get :show, :id => 'foo'
    end

    it 'should assing variables' do
      assigns(:startup).should == startup
    end

    describe 'with rendered views' do
      render_views

      it 'should render show template' do
        response.should render_template :show
      end
    end
  end

end
