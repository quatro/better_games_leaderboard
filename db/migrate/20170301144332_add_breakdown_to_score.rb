class AddBreakdownToScore < ActiveRecord::Migration[5.0]
  def change
    add_column :athlete_scores, :breakdown, :string
  end
end
