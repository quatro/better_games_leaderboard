class CreateRegionalScores < ActiveRecord::Migration[5.0]
  def change

    create_table :athletes do |t|
      t.string :name
      t.integer :userid
      t.string :regionid
      t.string :division  # Men, Women, Team

      t.timestamps
    end

    create_table :regional_scores do |t|
      t.references :athlete
      t.integer :year
      t.integer :workout
      t.string :score
      t.integer :minutes
      t.integer :seconds
      t.integer :fraction_seconds
      t.timestamps
    end
  end
end
