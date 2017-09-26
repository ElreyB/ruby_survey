class Answer < ActiveRecord::Base
  belongs_to(:questions)

  validates(:query, {:presence => true})
end
