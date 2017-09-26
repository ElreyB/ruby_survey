require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("pg")
require("pry")

get("/") do
  erb(:index)
end

get("/survey_form") do
  erb(:survey_form)
end

get("/survey_list") do
  @surveys = Survey.all
  erb(:survey_list)
end

post("/add_survey") do
  @survey = Survey.new({title: params['title']})
  if @survey.save
    redirect 'survey_list'
  else
    erb(:errors)
  end
end
