class VisitorsController < ApplicationController
  def index
    @statuses = Status.order("recorded_at DESC")
    index = @statuses.count
    @hash = Gmaps4rails.build_markers(@statuses) do |status, marker|
      recorded_at = I18n.l(status.recorded_at, format: "%Y-%m-%d %H:%M:%S")
      marker.title recorded_at
      infowindow = "#{recorded_at}<hr/>"
      infowindow += status.data.map do |k,v|
        "#{k}: #{v}"
      end.join("<br/>")
      marker.infowindow infowindow
      marker.lat status.data["latitude"]
      marker.lng status.data["longitude"]
      marker.picture({
        url: "http://chart.apis.google.com/chart?chst=d_map_spin&chld=1|0|33FF33|10|_|#{index}",
        width: 40,
        height: 60
      })
      marker.json(index: index, elevation: status["data"]["elevation"]&.round(2), message: status["data"]["messageContent"] || "---")
      index -= 1
    end
  end
end
