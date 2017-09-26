class CreateQuestionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |q|
      q.column(:query, :string)
      q.column(:survey_id, :integer)

      q.timestamps()
    end
  end
end
