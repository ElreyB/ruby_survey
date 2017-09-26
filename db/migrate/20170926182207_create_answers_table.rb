class CreateAnswersTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:answers) do |a|
      a.column(:solution, :string)
      a.column(:question_id, :integer)

      a.timestamps
    end
  end
end
