class Survey < ActiveRecord::Base
  has_many(:questions)

  before_save(:capitalizes_title)

  validates(:title, {:presence => true, :length => {:maximum => 50, :minimum => 5}})
  private

  def capitalizes_title
    title = self.title.split(" ")
    self.title = title.map{ |word| word.capitalize }.join(" ")


  end
end
