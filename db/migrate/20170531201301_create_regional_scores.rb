class CreateRegionalScores < ActiveRecord::Migration[5.0]
  def change

    create_table :athletes do |t|
      t.string :name
      t.integer :userid
      t.integer :regionid
      t.integer :division  # Men, Women, Team

      t.timestamps
    end

    create_table :regional_scores do |t|
      t.references :athlete
      t.integer :year
      t.integer :workout
      t.string :score
      t.integer :minutes, default: 10000
      t.integer :seconds, default: 10000
      t.integer :fraction_seconds, default: 10000
      t.integer :cap_count, default: 0
      t.boolean :is_wd, default: false
      t.string :scoredisplay
      t.timestamps
    end
  end
end
