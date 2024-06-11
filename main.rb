require_relative 'lib/my_chatgpt_cli_app'

def start_cli
  client = ChatGPTClient.new
  puts "Welcome to ChatGPT CLI!"
  loop do
    print "You: "
    prompt = gets.chomp
    break if prompt.downcase == 'exit'
    response = client.get_response(prompt)
    puts "ChatGPT: #{response.strip}"
  end
  puts "Goodbye!"
end

start_cli
