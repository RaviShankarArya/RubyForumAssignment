require 'rails_helper'

RSpec.describe Forum, type: :model do
	  

	describe "Forum" do

    let(:forum) { FactoryGirl.build(:forum)}

    before(:each) do
      expect(forum).to be_valid
    end

     context "Name validation" do
      it "should validate Name" do
      	forum.name = "New Thread"
        expect(forum).to be_valid
      end

      it "should not validate if Name is empty" do
        forum.name = ''
        expect(forum).to be_invalid
      end

      it "should not validate if Name is nil" do
        forum.name = nil
        expect(forum).to be_invalid
      end
    end
  end
end
