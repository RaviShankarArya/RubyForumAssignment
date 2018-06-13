require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "Post" do

    let(:post) { FactoryGirl.build(:post)}

    before(:each) do
      expect(post).to be_valid
    end

     context "Name validation" do
      it "should validate Name" do
      	post.name = "New Thread"
        expect(post).to be_valid
      end

      it "should not validate if Name is empty" do
        post.name = ''
        expect(post).to be_invalid
      end

      it "should not validate if Name is nil" do
        post.name = nil
        expect(post).to be_invalid
      end
    end


    context "Content validation" do
      it "should validate Name" do
      	post.content = "New Thread"
        expect(post).to be_valid
      end

      it "should not validate if content is empty" do
        post.content = ''
        expect(post).to be_invalid
      end

      it "should not validate if content is nil" do
        post.content = nil
        expect(post).to be_invalid
      end
    end
  end
end
