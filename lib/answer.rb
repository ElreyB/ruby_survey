class Answer < ActiveRecord::Base
  belongs_to(:questions)

  validates(:solution, {:presence => true})
end
