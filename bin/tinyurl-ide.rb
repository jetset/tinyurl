require "tty-prompt"
require "rest-client" 

BASE_URL = "http://localhost:3000/v1"

def display_menu
  choices = %w(shorten_url get_tiny_url exit)
  prompt = TTY::Prompt.new
  prompt.select("Please select your choice: ", choices)
end

def get_choice
  case display_menu
  when "shorten_url"
    shorten_url
  when "get_tiny_url"
    get_tiny_url
  when "exit"
    exit
  end
end

def shorten_url
  prompt = TTY::Prompt.new
  url = prompt.ask("What is your url that you want to shorten?")
  begin
    response  = RestClient.post "#{BASE_URL}/posts", {post: {url: url }}
    puts response
  rescue => e
    puts e
  end
  get_choice
end

def get_tiny_url
  prompt = TTY::Prompt.new
  url = prompt.ask("please enter your tiny url : ")
  begin 
    response  = RestClient.get url
    puts response.history
  rescue =>  e 
    puts e
  end
  get_choice
end

get_choice
