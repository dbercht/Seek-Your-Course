# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
def random_array
  @array = Array.new
  @random
  15.times do |x|
    @random = rand(2)
    if(@random == 1)
      if(x!=0)
        @array << x
      end
    end
  end
  if @array == []
    @array << (rand(15) + 1)
  end
  return @array
end
  
  @action = ['Drawing', 'Painting', 'Yoga', 'Life', 'Lessons', 'Brushing', 'Horseback Riding', 'Coffee making']
  @person = ['Elise', 'Alexandra', 'Tamara', 'Toby', 'Ian', 'Cassandra', 'Daniel', 'Jennifer']
  
60.times do |i|
@of = Offering.new(
    :title => @action[rand(@action.size)] + " with " + @person[rand(@person.size)], 
    :location_id => 1 + rand(50), 
    :specific_location => 'Some city',
    :registration_begins => Date.today + rand(50).days,
    :registration_deadline => Date.today + (50 + rand(20)).days,
    :start_date => Date.today + (70 + rand(50)).days,
    :link => "www.artschool.com",
    :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tempor, augue quis accumsan fringilla, libero neque feugiat ligula, ac venenatis est ligula vel augue. Praesent enim lorem, feugiat nec elementum eleifend, facilisis et urna.",
    :type_id => 1 + rand(4),
    :topic_ids => random_array,
    :validated => true
    )
    @con = Contact.create!(:name => "Elise Yaddadda", :number => '978 797 1323')
    @of.contact = @con
    @of.save
    end