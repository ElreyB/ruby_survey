ENV['RACK_ENV'] = 'test'

require("sinatra/activerecord")
require 'rspec'
require 'pg'
require 'survey'
require 'question'
require'answer'



RSpec.configure do |config|
  config.after(:each) do

    Question.all().each() do |question|
      question.destroy()
    end

    Survey.all.each do |survey|
      survey.destroy
    end

    Answer.all.each do |answer|
      answer.destroy
    end
  end
end
