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
  "prompt" => "Discussion sur un sujet",
  "max_tokens" => 500,
  "temperature" => 0,
}

response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip

# ligne qui permet d'envoyer l'information sur ton terminal
puts "On va discuter ensemble :"
puts gets.chomp
puts response_string
if gets.chomp == "stop"
    break
end