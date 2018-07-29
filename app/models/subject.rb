class Subject < ApplicationRecord
  #履修科目
has_many :student_subjects #学生履修科目を複数もっている
has_many :students, through: :student_subjects #student_subjectsを返して複数の学生と紐づいている
end
