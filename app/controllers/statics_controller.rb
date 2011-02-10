class StaticsController < ApplicationController
  def home
    @offering = Offering.new
    @topics = Topic.all
    @types = Type.all
  end
end
