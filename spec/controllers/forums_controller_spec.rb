require 'rails_helper'

describe ForumsController, :type => :controller  do



  describe "Forum" do
  let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    let(:forum_1) { FactoryGirl.create(:forum) }
    let(:forum_2) { FactoryGirl.create(:forum) }
    
    it "should list Threads" do
      get :index
      expect(assigns(:forums)).to eq([forum_1,forum_2])
    end

    it "Fetch particular Thread" do
      get :show, :id => forum_1.id
      expect(assigns(:forum)).to eq(forum_1)
    end
   end
 end