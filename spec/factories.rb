Factory.sequence(:user_name) { |n| "username_#{n}" }
Factory.sequence(:login) { |n| "login_#{n}" }
Factory.sequence(:movie) { |n| "movie_#{n}" }

Factory.define :user do |f|
  f.name      { Factory.next :user_name }
  f.nickname  { Factory.next :login }
end

Factory.define :movie do |f|
  f.title     { Factory.next :movie }
  f.year      { rand(10) + 1980 }
end

Factory.define :watch do |f|
  f.association :user
  f.association :movie
  f.status      'wish'
end

Factory.define :friendship do |f|
  f.association :user
  f.association :friend, :factory => :user
end