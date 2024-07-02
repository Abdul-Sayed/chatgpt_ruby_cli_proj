require 'minitest/autorun'
require_relative '../lib/chatgpt_cli_app'

class TestChatGPTClient < Minitest::Test
  def setup
    @client = ChatGPTClient.new
  end

  def test_clear_history
    # Simulate adding messages to the history
    @client.get_response("Is Ruby used in anything other than Rails")

    # Ensure messages are added
    refute_empty @client.instance_variable_get(:@messages)

    # Clear history
    @client.clear_history

    # Ensure messages are cleared
    assert_empty @client.instance_variable_get(:@messages)
  end
end
