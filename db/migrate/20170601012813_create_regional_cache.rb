class CreateRegionalCache < ActiveRecord::Migration[5.0]
  def change
    create_table :regional_athletes do |t|
      t.references :athlete
      t.string :athlete_name
      t.integer :year

      t.string :score_1_display
      t.string :score_2_display
      t.string :score_3_display
      t.string :score_4_display
      t.string :score_5_display
      t.string :score_6_display

      t.integer :score_1_rank, default: 10000
      t.integer :score_2_rank, default: 10000
      t.integer :score_3_rank, default: 10000
      t.integer :score_4_rank, default: 10000
      t.integer :score_5_rank, default: 10000
      t.integer :score_6_rank, default: 10000

      t.integer :rank_overall
      t.integer :points_overall

      t.timestamps
    end

    create_table :regional_athlete_scores do |t|
      t.references :regional_athlete
      t.references :regional_score
      t.string :scoredisplay
      t.integer :workout
      t.integer :rank
      t.integer :points
      t.timestamps
    end
  end
end
