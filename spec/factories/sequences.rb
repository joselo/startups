Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.sequence :url do |n|
  "http://www.example#{n}.com"
end

Factory.sequence :name do |n|
  "name#{n}"
end