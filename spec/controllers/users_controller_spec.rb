require 'spec_helper'

describe UsersController do
  let(:current_user) { stub_model(User) }
  let(:user_params){ {'email' => 'foo'} }

  before do
    OmniAuth.config.mock_auth[:twitter] = { 'uid' => '123545' }
    controller.stub!(:current_user).and_return(current_user)
  end

  describe "#index" do
    before do
      get :index
    end

    it 'should assing variables' do
      assigns(:user).should == current_user
    end

    describe 'with rendered views' do
      render_views

      it 'should render index template' do
        response.should render_template :index
      end
    end

  end


  describe "#update" do
    context 'with successful update' do
      before do
        current_user.should_receive(:update_attributes).with(user_params).and_return(true)
        post :update, :user => user_params
      end

      it 'should assing variables' do
        assigns(:user).should == current_user
      end

      describe 'with rendered views' do
        render_views

        it 'should redirect to me_profile_path' do
          response.should redirect_to me_profile_path
        end
      end
    end

    context 'without successful update' do
      before do
        current_user.should_receive(:update_attributes).with(user_params).and_return(false)
        post :update, :user => user_params
      end

      describe 'with rendered views' do
        render_views

        it 'should render edit template' do
          response.should render_template :edit
        end
      end
    end

  end

end
