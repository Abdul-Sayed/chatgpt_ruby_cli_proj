require 'http'
require 'dotenv/load'

class ChatGPTClient
  attr_accessor :api_key, :base_url

  def initialize
    @api_key = ENV['OPENAI_API_KEY']
    @base_url = 'https://api.openai.com/v1/engines/davinci-codex/completions'
  end

  def get_response(prompt)
    response = HTTP.post(
      @base_url,
      headers: { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@api_key}" },
      json: { prompt: prompt, max_tokens: 150 }
    )
    response.parse['choices'].first['text']
  end
end
