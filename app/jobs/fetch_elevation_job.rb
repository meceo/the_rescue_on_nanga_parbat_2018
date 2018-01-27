class FetchElevationJob < ApplicationJob

  def perform(status_id)
    status = Status.find(status_id)
    return if status.data["elevation"].present?

    response = HTTParty.get("https://maps.googleapis.com/maps/api/elevation/json?locations=#{status.data["latitude"]},#{status.data["longitude"]}&key=AIzaSyB2BYXnM454PczI-KgYS1qMXHal3z92L7Q")
    if response.code == 200
      if result = JSON.parse(response.body)["results"].first
        data = status.data.merge(
          elevation: result["elevation"],
          elevation_resolution: result["resolution"]
        )
        status.update!(data: data)
      end
    end
  end
end
