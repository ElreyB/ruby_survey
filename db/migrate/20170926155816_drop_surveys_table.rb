class DropSurveysTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :surveys
  end
end
