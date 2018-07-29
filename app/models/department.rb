class Department < ApplicationRecord
  #学部
  has_many :students #学部に複数の学生が所属している
end
