class FetchJob < ApplicationJob

  def perform
    FetchJob.set(wait_until: (60 + 60 + 35).seconds.from_now).perform_later # no more than every 2.5 minutes
    response = HTTParty.get('https://api.findmespot.com/spot-main-web/consumer/rest-api/2.0/public/feed/0hN62C8mlLHPINqVLLi8qAv2qonI9biev/message?limit=50')
    api_response = ApiResponse.create!(code: response.code, body: response.body, message: response.message, headers: response.headers.inspect)

    ExtractStatusesJob.perform_later(api_response.id)
  end
end
