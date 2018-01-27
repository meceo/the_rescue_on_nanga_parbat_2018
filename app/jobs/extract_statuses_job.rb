class ExtractStatusesJob < ApplicationJob

  def perform(response_id)
    response = ApiResponse.find(response_id)

    if response.code == 200
      hash = JSON.parse(response.body)
      hash["response"]["feedMessageResponse"]["messages"]["message"].each do |message|
        Status.find_or_create_by!(identifier: message["id"]) do |status|
          status.recorded_at = Time.at(message["unixTime"])
          status.data = message
        end
      end
    end
  end
end
