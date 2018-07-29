class Student < ApplicationRecord
  #学生
  belongs_to :department #学生は１つの学部に所属している
end
