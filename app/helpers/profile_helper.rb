module ProfileHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}" unless (url.nil? || (url.size == 0))
  end

  def other_links_tag(links)
    unless links.nil? 
      @ar = links.split(", ")
      html = Array.new
      @ar.each do |link|
        html << link_to(link, url_with_protocol(link).html_safe, :target => "_blank")
      end
      html.join("<br />").html_safe
    end
  end

	def twitter_with_protocol(twitter)
		if twitter[0] == 64
			twitter = 'www.twitter.com/'+twitter[1,twitter.length]
		elsif (twitter[0,3] == 'www') || (twitter[0,7] == 'http://') || (twitter[0,7] == "twitter")
			twitter
		else
			twitter = 'www.twitter.com/'+twitter
		end	
	end

end
