class Workout < ActiveRecord::Base
  attr_accessible :name, :exercises_attributes

  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts, source: :exercise

  has_many :user_workouts
  has_many :users, through: :user_workouts, source: :user

  accepts_nested_attributes_for :exercises, allow_destroy: true

end
