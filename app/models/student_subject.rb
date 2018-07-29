class StudentSubject < ApplicationRecord
  #学生履修科目
  belongs_to :student #学生と1対１の関係
  belongs_to :subject #履修科目と1対１の関係
end
