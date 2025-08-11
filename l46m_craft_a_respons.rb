# Chatbot Generator Notebook

# Define a class for the chatbot
class Chatbot
  attr_accessor :name, :responses

  def initialize(name)
    @name = name
    @responses = {}
  end

  # Add a response to the chatbot
  def add_response(trigger, response)
    @responses[trigger] = response
  end

  # Get a response from the chatbot
  def get_response(trigger)
    @responses[trigger]
  end
end

# Define a class for the chatbot generator
class ChatbotGenerator
  def self.generate_chatbot(name, responses)
    chatbot = Chatbot.new(name)
    responses.each do |trigger, response|
      chatbot.add_response(trigger, response)
    end
    chatbot
  end
end

# Define a method to create a chatbot from a JSON file
def create_chatbot_from_json(file_path)
  json = JSON.parse(File.read(file_path))
  name = json['name']
  responses = json['responses']
  ChatbotGenerator.generate_chatbot(name, responses)
end

# Example usage:
# chatbot = create_chatbot_from_json('chatbot.json')
# puts chatbot.get_response('hello')

# Define a method to create a chatbot from a YAML file
def create_chatbot_from_yaml(file_path)
  yaml = YAML.load_file(file_path)
  name = yaml['name']
  responses = yaml['responses']
  ChatbotGenerator.generate_chatbot(name, responses)
end

# Example usage:
# chatbot = create_chatbot_from_yaml('chatbot.yaml')
# puts chatbot.get_response('hello')

# Define a method to generate a chatbot from user input
def generate_chatbot_from_user_input
  print "Enter chatbot name: "
  name = gets.chomp
  print "Enter number of responses: "
  num_responses = gets.to_i
  responses = {}
  num_responses.times do |i|
    print "Enter trigger #{i+1}: "
    trigger = gets.chomp
    print "Enter response #{i+1}: "
    response = gets.chomp
    responses[trigger] = response
  end
  ChatbotGenerator.generate_chatbot(name, responses)
end

# Example usage:
# chatbot = generate_chatbot_from_user_input
# puts chatbot.get_response('hello')