require_relative 'lib/chatgpt_cli_app'


def start_cli
  client = ChatGPTClient.new
  puts "Welcome to ChatGPT CLI!"
  puts "Type your prompt below, or 'clear' to reset conversation, or 'exit' to close the application."
  loop do
    print "You: "
    prompt = gets.chomp
    break if prompt.downcase == 'exit'

    if prompt.downcase == 'clear'
      client.clear_history
      puts "Chat history cleared."
      next
    end

    response = client.get_response(prompt)
    if response
       puts "ChatGPT: #{response.strip}"
    else
      puts "Unable to generate a response"
    end
  end

  puts "Goodbye!"
end

start_cli


# require 'uri'
# require 'net/http'
# require 'json'
# require 'dotenv/load'
# require_relative 'lib/chatgpt_cli_app'

# message_content = "What are the best permaculture textbooks"

# # Create the URL
# url = URI("https://chat-gpt26.p.rapidapi.com/")

# # Initialize the HTTP object
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true

# # Create the HTTP POST request
# request = Net::HTTP::Post.new(url)
# request["x-rapidapi-key"] = '20d6ba469amsha1ce3359262752dp147addjsn80d3e5c4bb09'
# request["x-rapidapi-host"] = 'chat-gpt26.p.rapidapi.com'
# request["Content-Type"] = 'application/json'

# # Build the request body as a hash to supply the question
# request_body = {
#   "model" => "gpt-3.5-turbo",
#   "messages" => [
#     { "role" => "user", "content" => message_content }
#   ]
# }

# # Convert the hash to a JSON string and set it as the request body
# request.body = request_body.to_json

# # Send the request and print the response
# response = http.request(request)

# # Parse the JSON response to extract the answer
# parsed_response = JSON.parse(response.body)

# begin
#   # Attempt to extract and print the message content
#   puts parsed_response["choices"][0]["message"]["content"]
# rescue Exception => e
#   # handle the exception
#   puts "No response received from the API, #{e.message}"
# end
