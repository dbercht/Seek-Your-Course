module OfferingsHelper
  def artists_for_offering(offering)
    html = Array.new

    if((offering.type.category == "eCourse") && (offering.coordinator.role == User::ROLES[0]))
      html << link_to(offering.coordinator.name, offering.coordinator)
    end
			artist_size = 0
			reg_artist_index = 0
			unreg_artist_index = 0
			unreg_artists = offering.unregistered_artists.split(", ")
			ra = offering.registered_artists.nil?
			ura = offering.registered_artists.nil?

			while(artist_size < 4) do

				if((!ra)  && (reg_artist_index < offering.registered_artists.size)) 
					html << link_to(offering.registered_artists[reg_artist_index].name, offering.registered_artists[reg_artist_index])
					reg_artist_index = reg_artist_index + 1
				elsif(!ura && (unreg_artist_index < unreg_artists.size))
					html << unreg_artists[unreg_artist_index]
					unreg_artist_index = unreg_artist_index + 1
				end
				artist_size = artist_size + 1
			end
			if((offering.registered_artists.size + unreg_artists.size) > 3)
				html << "Various"
			end

			str = html.uniq.join(", ").html_safe
			str = str + " | "
#      if(offering.registered_artists.size == 0)
#        html << [offering.unregistered_artists.split(", ")[0]]
#        if(offering.unregistered_artists.split(", ").size > 1)
#          html << [offering.unregistered_artists.split(", ")[1]]
#        end
#        if(offering.unregistered_artists.split(", ").size > 1)
#          html << ["Various"]
#        end
#      elsif(0 < offering.registered_artists.size && offering.registered_artists.size <= 2 )
#        offering.registered_artists.size.times do |i|
#          html << link_to(offering.registered_artists[i].name, offering.registered_artists[i])
#        end
#        if((offering.registered_artists.size + (offering.unregistered_artists.split(", ").size)) > 2)
#          html << ["Various"]
#        end
#      end
#    if(html.length >  0)
##      str = html.uniq.join(", ").html_safe
 #     str = str+ " | "
#    end
  end

  def artists_for_title(offering)
    html = Array.new
    if((offering.type.category == "eCourse") && (offering.coordinator.role == User::ROLES[0]))
      html << link_to(offering.coordinator.name, offering.coordinator)
    end
		offering.registered_artists.size.times do |i|
      unless (offering.registered_artists[i] == offering.coordinator)
        html << [link_to(offering.registered_artists[i].name, offering.registered_artists[i])]  end
    end
    if(offering.unregistered_artists.size > 0)
      html << [offering.unregistered_artists.split(", ")]  
    end
     if(html.length >  0)
      str = html.join(", ").html_safe
    end
  end
 
  def show_topics_for(offering)
    html = Array.new
    if(offering.topics.size < 4)
      offering.topics.size.times do |i|
        html << link_to(offering.topics[i].category, offering.topics[i])
      end
    end 
    if(offering.topics.size > 3)
			4.times do |i|
        html << link_to(offering.topics[i].category, offering.topics[i])
      end
      html << "and more"
    end  
    str = html.join(", ").html_safe
  end
  
  def list_topics(topics, offering)
    html = Array.new
    topics.each do |topic|
        html << "<div>"
        html << check_box_tag("offering[topic_ids][]", topic.id, @offering.topics.include?(topic))
        html << topic.category
        html << "</div>"
       
     end
    html.join(" ").html_safe
  end

  def date_input_for(f, offering, date, attribute, attribute_label)
    value_date = date.strftime('%Y-%h-%d') unless date.nil?
    input = "<input type='text' id='#{attribute}' class='date' value='#{value_date}'/>".html_safe
    html = Array.new
    html << content_tag(:tr, content_tag(:td, f.label("#{attribute_label}")) << content_tag(:td, input << content_tag(:span, f.date_select(attribute, :prompt=>true), :class=>'date_select')))
    html.join("").html_safe
  end

end
