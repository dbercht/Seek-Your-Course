module OfferingsHelper
  def artists_for_offering(offering)
    html = Array.new
    if(offering.type.category == "E-course")
      html << link_to (offering.coordinator.name, offering.coordinator)
    else
      if(offering.registered_artists.size == 0)
        html << [offering.unregistered_artists.split(", ")[0]]
        if(offering.unregistered_artists.split(", ").size > 1)
          html << [offering.unregistered_artists.split(", ")[1]]
        end
        if(offering.unregistered_artists.split(", ").size > 1)
          html << ["Various"]
        end
      elsif(0 < offering.registered_artists.size && offering.registered_artists.size <= 2 )
        offering.registered_artists.size.times do |i|
          html << [link_to (offering.registered_artists[i].name, offering.registered_artists[i])]
        end
        if(offering.registered_artists.size > 2)
          html << ["Various"]
        end
      end
    end
    if(html.size > 0)
      str = html.join(", ").html_safe
      str = str+ " | "
    end
  end
 
  def show_topics_for(offering)
    html = Array.new
    if(offering.topics.size < 5)
      offering.topics.size.times do |i|
        html << link_to (offering.topics[i].category, offering.topics[i])
      end
    end 
    if(offering.topics.size > 4)
      html << "and more"
    end  
    str = html.join(", ").html_safe
  end
  
end
