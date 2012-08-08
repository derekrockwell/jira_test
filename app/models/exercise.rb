class Exercise < ActiveRecord::Base
  attr_accessible :name

  has_many :exercise_workouts
  has_many :workouts, through: :exercise_workouts, source: :workout
end
