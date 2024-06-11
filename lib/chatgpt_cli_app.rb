# require 'http'
# require 'dotenv/load'

# class ChatGPTClient
#   attr_accessor :api_key, :base_url

#   def initialize
#     @api_key = ENV['OPENAI_API_KEY']
#     @base_url = 'https://api.openai.com/v1/chat/completions'
#   end

#   def get_response(prompt)
#     response = HTTP.post(
#       @base_url,
#       headers: { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@api_key}" },
#       json: {
#         model: "gpt-3.5-turbo",
#         messages: [{ role: "user", content: prompt }],
#         max_tokens: 150
#       }
#     )
#     response_data = response.parse
#     puts response_data
#       begin
#         response_data.choices[0].text
#       rescue NoMethodError => e
#         puts "Error: Unexpected response structure"
#       end
#   end
# end

require "ruby/openai"
require 'dotenv/load'

class ChatGPTClient
  attr_accessor :api_key

  def initialize
    @api_key = ENV['OPENAI_API_KEY']
  end

  def get_response(prompt)
    client = OpenAI::Client.new(access_token: @api_key)
    response = client.completions(
    parameters: {
      model: "text-davinci-003",
      prompt: prompt,
      max_tokens: 2000
    })
    return response['choices'][0]['text']
  end
end
