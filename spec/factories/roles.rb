FactoryGirl.define do
  factory :role do
    name "Admin"
    description "admin related description"
    association :user, :factory => :user, :strategy => :build
  end
end
