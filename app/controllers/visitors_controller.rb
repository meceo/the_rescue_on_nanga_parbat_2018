class VisitorsController < ApplicationController
  def index
    @statuses = Status.order("recorded_at DESC")
    index = @statuses.count
    @hash = Gmaps4rails.build_markers(@statuses) do |status, marker|
      marker.title status.recorded_at
      marker.infowindow status.data.map{|k,v| "#{k}: #{v}"}.join("<br/>")
      marker.lat status.data["latitude"]
      marker.lng status.data["longitude"]
      marker.picture({
        url: "https://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=#{index}|FF0000|000000",
        width: 32,
        height: 32
      })
      marker.json(index: index)
      index -= 1
    end
  end
end
