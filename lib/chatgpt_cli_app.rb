require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

class ChatGPTClient
  attr_accessor :api_key

  def initialize
    @api_key = ENV['OPENAI_API_KEY']
    @messages = []
  end

  def get_response(prompt)
    # Create the URL
    url = URI("https://open-ai21.p.rapidapi.com/conversationgpt35")

    # Initialize the HTTP object
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    # Configure the HTTP POST request
    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-key"] =  @api_key
    request["x-rapidapi-host"] = 'open-ai21.p.rapidapi.com'
    request["Content-Type"] = 'application/json'

    # Add the new user message to the messages array
    @messages << { role: "user", content: prompt }

    # Build the request body as a hash to supply the user prompt
    request_body = {
      messages: @messages,
      web_access: true
    }

    # Convert the hash to a JSON string to post to the api
    request.body = request_body.to_json

    # Send the request
    response = http.request(request)

    # Parse the JSON response into a ruby object
    parsed_response = JSON.parse(response.read_body)

    begin
      # Attempt to extract the response
      ai_response = parsed_response["result"]
      # Add the AI's response to the messages array
      @messages << { role: "assistant", content: ai_response }
      # Return the AI's response
      return ai_response
    rescue Exception => e
      # handle the exception
      puts "No response received from the API, #{e.message}"
      return nil
    end

  end

  def clear_history
    @messages = []
  end

end
