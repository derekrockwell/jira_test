class ExerciseWorkout < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :exercise 
  belongs_to :workout
end
