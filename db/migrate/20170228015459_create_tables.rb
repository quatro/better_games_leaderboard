class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :wods do |t|
      t.string :name
      t.string :score_type
      t.timestamps
    end

    create_table :athletes do |t|
      t.string :name
      t.integer :games_id
      t.timestamps
    end

    create_table :athlete_scores do |t|
      t.references :wod
      t.references :athlete
      t.integer :place_region
      t.integer :place_worldwide
      t.integer :version
      t.timestamps
    end

    create_table :scrapes do |t|
      t.integer :competition
      t.integer :year
      t.integer :division
      t.integer :scaled
      t.integer :fittest
      t.string :fittest1
      t.integer :occupation
      t.integer :sort

      t.integer :currentpage
      t.integer :totalpages
      t.string :name
      t.integer :userid
      t.string :overallrank
      t.string :overallscore
      t.string :regionid
      t.string :region
      t.string :affiliateid
      t.string :affiliate
      t.integer :age
      t.integer :highlight
      t.string :height
      t.string :weight
      t.string :profilepic
      t.integer :division

      t.integer :batch
    end

    create_table :scrape_scores do |t|
      t.integer :workoutrank
      t.string :workoutresult
      t.string :scoreidentifier
      t.string :scoredisplay
      t.string :video
    end


  end
end
