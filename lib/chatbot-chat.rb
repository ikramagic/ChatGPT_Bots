require 'http'
require 'dotenv'
require 'json'

Dotenv.load

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

data = {
  "prompt" => gets.chomp,
  "max_tokens" => 500,
  "temperature" => 0,
}

response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip

loop do 

  print "Ton message :"
  puts gets.chomp
  print "ChatGPT a dit : "
  puts response_string

  break if gets.chomp == "stop"
end