# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :startup do
    name Factory.next(:name)
    description "MyText"
    twitter "MyString"
    facebook "MyString"
    url Factory.next(:url)
  end
end
