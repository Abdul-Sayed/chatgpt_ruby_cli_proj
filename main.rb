require_relative 'lib/chatgpt_cli_app'
require 'dotenv/load'
require "ruby/openai"


def start_cli
  # client = ChatGPTClient.new
  # puts "Welcome to ChatGPT CLI!"
  # loop do
  #   print "You: "
  #   prompt = gets.chomp
  #   break if prompt.downcase == 'exit'
  #   response = client.get_response(prompt)
  #   pp response
  #   # puts "ChatGPT: #{response.strip}"
  # end
  # puts "Goodbye!"

  client = OpenAI::Client.new(access_token: 'YOUR_API_TOKEN')

 prompt = 'What is ruby metaprogramming?'

 response = client.completions(
    parameters: {
      model: "text-davinci-003",
      prompt: prompt,
      max_tokens: 2000
    })

puts response['choices'][0]['text']

end

start_cli
