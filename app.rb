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

get("/question_form") do
  @surveys = Survey.all
  erb(:question_form)
end

get("/surveys/:id") do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb(:survey)
end

get("/answer_form") do
  @surveys = Survey.all
  erb(:answer_form)
end

post("/add_survey") do
  @survey = Survey.new({title: params['title']})
  if @survey.save
    redirect 'survey_list'
  else
    @error_type = @survey
    erb(:errors)
  end
end

post("/add_questions") do
  survey_id = Survey.find(params['survey_id'])
  @question = Question.new({query: params['question'], survey_id: survey_id.id})
  if @question.save
    erb(:success)
  else
    @error_type = @question
    erb(:errors)
  end
end
