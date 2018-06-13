FactoryGirl.define do
  factory :post do
    name "New Post"
    content "some Valid content"
    association :forum, :factory => :forum, :strategy => :build

  end
end
