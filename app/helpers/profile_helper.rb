module ProfileHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}" unless url.size == 0
  end

end
