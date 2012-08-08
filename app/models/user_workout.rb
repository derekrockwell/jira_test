class UserWorkout < ActiveRecord::Base
   # attr_accessible :title, :body
  belongs_to :user 
  belongs_to :workout 
end
