class Question < ActiveRecord::Base
  belongs_to(:surveys)

  validates(:query, {:presence => true})
end
