require 'minitest/autorun'
require_relative '../lib/chatgpt_cli_app'

class TestChatGPTClient < Minitest::Test
  def setup
    @client = ChatGPTClient.new
  end

  def test_initialization
    assert_equal ENV['OPENAI_API_KEY'], @client.api_key
    assert_equal 'https://api.openai.com/v1/engines/davinci-codex/completions', @client.base_url
  end
end
