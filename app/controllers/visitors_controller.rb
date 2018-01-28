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
        url: "https://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=#{index}|FF0000|000000",
        width: 32,
        height: 32
      })
      marker.json(index: index, elevation: status["data"]["elevation"]&.round(2), message: status["data"]["messageContent"] || "---")
      index -= 1
    end
  end
end
