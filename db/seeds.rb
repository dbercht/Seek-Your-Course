# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create!(:name => 'Daley', :city => cities.first)

Offering.destroy_all
Type.destroy_all
Topic.destroy_all
Region.destroy_all
Location.destroy_all
Plan.destroy_all
User.destroy_all

User.create!(:username => 'artist', 
		:password => 'seekyourcourse', 
		:password_confirmation => 'seekyourcourse', 
		:email => 'artist@syc.com', 
		:is_admin => false, 
		:name => "Artist",
		:role => "Artist"
)

User.create!(:username => 'coordinator', 
		:password => 'seekyourcourse', 
		:password_confirmation => 'seekyourcourse', 
		:email => 'coordinator@syc.com', 
		:is_admin => false, 
		:name => "Coordinator",
		:role => "Coordinator"
)

User.create!(:username => 'admin', 
		:password => 'seekyourcourse', 
		:password_confirmation => 'seekyourcourse', 
		:email => 'admin@syc.com', 
		:is_admin => true, 
		:name => "Admin",
		:role => "Artist"
)

Type.create!(:category => "E-course")
Type.create!(:category => "Weekend Retreat")

Topic.create!(:category => "Drawing")
Topic.create!(:category => "Sculpting")
Topic.create!(:category => "Being Awesome")
Topic.create!(:category => "Writing")
Topic.create!(:category => "Education")

Plan.create!(:name => "Basic")
Plan.create!(:name => "Pro 1")
Plan.create!(:name => "Pro 2")

Region.create!(:name => "North America")
Region.create!(:name => "Asia")

60.times do |i|
Location.create!(:state => "State#{i}", :region_id => rand(2)+ 1)
end

 def random_array
   @array = Array.new
   @random
   (Topic.all.size).times do |x|
     @random = rand(2)
     if(@random == 1)
       if(x!=0)
         @array << x
       end
     end
   end
   if @array == []
     @array << Topic.all.size - 1
   end
   return @array
 end
  
   @action = ['Drawing', 'Painting', 'Yoga', 'Life', 'Lessons', 'Brushing', 'Horseback Riding', 'Coffee making']
   @person = ['Elise', 'Alexandra', 'Tamara', 'Toby', 'Ian', 'Cassandra', 'Daniel', 'Jennifer']
  
 100.times do |i|
 @of = Offering.new(
     :title => @action[rand(@action.size)] + " with " + @person[rand(@person.size)],
     :location_id => Location.find(1 + rand(Location.all.size)).id,
     :specific_location => 'Some city',
     :registration_begins => Date.today + rand(50).days,
     :registration_deadline => Date.today + (50 + rand(20)).days,
     :start_date => Date.today + (70 + rand(50)).days,
     :link => "www.artschool.com",
     :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tempor, augue quis accumsan fringilla, libero neque feugiat ligula, ac venenatis est ligula vel augue. Praesent enim lorem, feugiat nec elementum eleifend, facilisis et urna.",
     :type_id => 1 + rand(Type.all.size),
     :topic_ids => random_array,
     :plan_id => 1+ rand(Plan.all.size),
     :coordinator_id => 1 + rand(User.all.size)
     )
     @of.save
  end
    
