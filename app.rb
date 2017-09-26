require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
require("./lib/answer")
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
  @questions = []
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
    @succes_message = "Question has been added to Survey"
    erb(:success)
  else
    @error_type = @question
    erb(:errors)
  end
end

post("/pick_survey") do
  @surveys = Survey.all
  @survey = Survey.find(params['surveys'])
  @questions = @survey.questions
  erb(:answer_form)
end

post("/add_answer") do
  question_id = Question.find(params['question_id'])
  @answer = Answer.new({solution: params['answer'], question_id: question_id.id})
  # binding.pry
  if @answer.save
    @succes_message = "Answer has been added to Question"
    erb(:success)
  else
    @error_type = @answer
    erb(:errors)
  end
end
