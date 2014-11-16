# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141116223545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_player_results", force: true do |t|
    t.string  "roster_spot"
    t.string  "player_name"
    t.integer "game_played"
    t.integer "minutes_played"
    t.integer "field_goals_made"
    t.integer "field_goals_attempted"
    t.integer "free_throws_made"
    t.integer "free_throws_attempted"
    t.integer "rebounds"
    t.integer "assists"
    t.integer "steals"
    t.integer "blocks"
    t.integer "turnovers"
    t.integer "points"
    t.integer "fantasy_points"
  end

  create_table "league_stats_tables", force: true do |t|
    t.string   "team_name"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempted"
    t.integer  "free_throws_made"
    t.integer  "free_throws_attempted"
    t.integer  "rebounds"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "turnovers"
    t.integer  "points"
    t.integer  "points_for"
    t.integer  "points_against"
    t.string   "current_streak"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
