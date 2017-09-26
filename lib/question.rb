class Question < ActiveRecord::Base
  belongs_to(:surveys)
  has_many(:answers)

  validates(:query, {:presence => true})
end
