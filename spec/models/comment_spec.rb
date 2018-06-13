require 'rails_helper'

RSpec.describe Comment, type: :model do

	describe "Comment" do

    let(:comment) { FactoryGirl.build(:comment)}

    before(:each) do
      expect(comment).to be_valid
    end

     context "body validation" do
      it "should validate body" do
      	comment.body = "New Thread"
        expect(comment).to be_valid
      end

      it "should not validate if body is empty" do
        comment.body = ''
        expect(comment).to be_invalid
      end

      it "should not validate if body is nil" do
        comment.body = nil
        expect(comment).to be_invalid
      end
    end
  end
end
