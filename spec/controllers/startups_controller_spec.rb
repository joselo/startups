require 'spec_helper'

describe StartupsController do
  let(:current_user) { stub_model(User) }
  let(:startup){ stub_model(Startup) }
  let(:startup_params){ {'name' => 'foo'} }

  before do
    OmniAuth.config.mock_auth[:twitter] = { 'uid' => '123545' }
    controller.stub!(:current_user).and_return(current_user)
  end

  describe "#index" do
    before do
      current_user.should_receive(:startups).and_return([startup])
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

  describe "#show" do
    before do
      current_user.should_receive(:find_startup).with('foo').and_return(startup)
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

  describe "#create" do
    context 'with successful create' do
      before do
        startup.should_receive(:save).and_return(true)
        current_user.should_receive(:new_startup).with(startup_params).and_return(startup)
        post :create, :startup => startup_params
      end

      it 'should assing variables' do
        assigns(:startup).should == startup
      end

      describe 'with rendered views' do
        render_views

        it 'should redirect to me_startup_path' do
          response.should redirect_to [:me, startup]
        end
      end
    end

    context 'without successful create' do
      before do
        startup.should_receive(:save).and_return(false)
        current_user.should_receive(:new_startup).with(startup_params).and_return(startup)
        post :create, :startup => startup_params
      end

      describe 'with rendered views' do
        render_views

        it 'should render new template' do
          response.should render_template :new
        end
      end
    end

  end

  describe "#update" do
    context 'with successful update' do
      before do
        startup.should_receive(:update_attributes).with(startup_params).and_return(true)
        current_user.should_receive(:find_startup).with('foo').and_return(startup)
        post :update, :id => 'foo', :startup => startup_params
      end

      it 'should assing variables' do
        assigns(:startup).should == startup
      end

      describe 'with rendered views' do
        render_views

        it 'should redirect to me_startup_path' do
          response.should redirect_to [:me, startup]
        end
      end
    end

    context 'without successful update' do
      before do
        startup.should_receive(:update_attributes).with(startup_params).and_return(false)
        current_user.should_receive(:find_startup).with('foo').and_return(startup)
        post :update, :id => 'foo', :startup => startup_params
      end

      describe 'with rendered views' do
        render_views

        it 'should render edit template' do
          response.should render_template :edit
        end
      end
    end

  end

  describe '#destroy' do
    before do
      startup.should_receive(:destroy).and_return(true)      
      current_user.should_receive(:find_startup).with('foo').and_return(startup)
      post :destroy, :id => 'foo'
    end

    it 'should assigns variables' do
      assigns(:startup).should == startup
    end

    describe 'with rendered views' do
      render_views

      it 'should redirect to me_startups_path' do
        response.should redirect_to me_startups_path
      end
    end

  end

end
