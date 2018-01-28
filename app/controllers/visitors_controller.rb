class VisitorsController < ApplicationController
  def index
    @statuses = Status.order("recorded_at DESC")
    total_count = @statuses.count
    index = @statuses.count
    @hash = Gmaps4rails.build_markers(@statuses) do |status, marker|
      recorded_at = I18n.l(status.recorded_at, format: "%Y-%m-%d %H:%M:%S")
      previous_status = @statuses[total_count - index + 1]
      speed = nil
      if previous_status && previous_status.data["elevation"].present? && status.data["elevation"].present?
        distance_difference = status.data["elevation"] - previous_status.data["elevation"]
        time_difference = (status.recorded_at - previous_status.recorded_at) / 3600
        speed = (distance_difference / time_difference).round
        # puts [previous_status.data["elevation"], status.data["elevation"], distance_difference, time_difference, distance_difference / time_difference]
      end
      # puts "prev: #{previous_status&.recorded_at}, curr #{status.recorded_at}"
      marker.title recorded_at
      infowindow = "#{recorded_at}<hr/>"
      infowindow += status.data.map do |k,v|
        "#{k}: #{v}"
      end.join("<br/>")
      marker.infowindow infowindow
      marker.lat status.data["latitude"]
      marker.lng status.data["longitude"]
      marker.picture({
        url: "https://chart.apis.google.com/chart?chst=d_map_spin&chld=1|0|33FF33|10|_|#{index}",
        width: 40,
        height: 60
      })
      marker.json(
        index: index,
        elevation: status["data"]["elevation"]&.round(2),
        message: status["data"]["messageContent"] || "---",
        speed: speed || "---"
      )
      index -= 1
    end
  end
end
