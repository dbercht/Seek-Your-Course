Factory.define :region do |r|
  r.sequence(:name) { |r| "Region#{r}"}
end

Factory.define :region_na, :parent => :region do |r|
  r.name 'North America'
end

Factory.define :region_asia, :parent => :region do |r|
  r.name 'Asia'
end

Factory.define :location do |r|
  r.state "Foo"
  r.association(:region)
end

Factory.define :location_na, :parent => :location do |r|
  r.state 'United States'
  r.association(:region_na)
end

Factory.define :location_asia, :parent => :location do |r|
  r.state 'China'
  r.association(:region_asia)
end

Factory.define :plan do |f|
  f.sequence(:name) { |x| "Foo#{x}"}
end

Factory.define :plan_basic, :parent => :plan do |p|
  p.name "Basic"
end

Factory.define :plan_pro, :parent => :plan do |p|
  p.name "Pro"
end

Factory.sequence :topic_unique do |n|
  "TOPIC_#{n}"
end

Factory.define :topic do |topic|
  topic.category { Factory.next(:topic_unique)}
end

Factory.define :type do |p|
  p.sequence(:category) { |n| "categoryFoo#{n}" }
end

Factory.define :user do |f|
  f.sequence(:username) { |n| "foo#{n}" }
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "foo#{n}@example.com" }
end

Factory.define :coordinator, :parent => :user do |c|
end

Factory.define :offering do |f|
  f.association			:location
  #f.association			:region
  f.association			:coordinator
  f.association			:plan
  f.association			:topic
  f.association			:type
  f.title 			"Foo"
  f.specific_location 		"Madagascar"
  f.link 			"www.google.com"
  f.description 		"Lorem ipsum dolorem" 
  f.start_date			5.days.from_now 
  f.registration_begins		2.days.from_now 
  f.registration_deadline	3.days.from_now
end
