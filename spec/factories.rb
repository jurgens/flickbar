Factory.sequence(:user_name) { |n| "username_#{n}" }
Factory.sequence(:login) { |n| "login_#{n}" }

Factory.define :user do |f|
  f.name      { Factory.next :user_name }
  f.nickname  { Factory.next :login }
end