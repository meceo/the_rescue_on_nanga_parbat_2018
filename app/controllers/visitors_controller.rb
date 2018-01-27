class VisitorsController < ApplicationController
  def index
    @statuses = Status.all
    @hash = Gmaps4rails.build_markers(@statuses) do |status, marker|
      marker.lat status.data["latitude"]
      marker.lng status.data["longitude"]
    end
  end
end
