class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @departments = Department.all
    @students = @q.result(distinct: true)
  end

  def search
    @q = Student.search(search_params)
    @students = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
