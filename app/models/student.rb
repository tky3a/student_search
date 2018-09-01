class Student < ApplicationRecord
  #学生
  belongs_to :department #学生は１つの学部に所属している

  def self.import(file)
    workbook = RubyXL::Parser.parse(file.path)
    worksheet = workbook[0] #初めのシートを読み込み
    (0..4).each do |i|
      cell_value = worksheet[1][i].value
    p cell_value
  end
  end

  def self.to_xlsx(students) #引数にテーブルを受け渡す
    # binding.pry
    require "rubyXL"
    # @workbook = RubyXL::Workbook.new #新規作成
    # @worksheet = @workbook[0] #最初のシートを読み込み
    # @worksheet.add_cell(0, 0, "Hello, World")
    # @workbook.write("out.xlsx")
     # binding.pry
     @workbook = RubyXL::Workbook.new
     @worksheet = @workbook[0]

    student_row = %w(氏名 EMAIL 生年月日)
     student_row.each_with_index do |val, row_idx|
       @worksheet.add_cell(0, row_idx, val)
     end

    students.each.with_index(1) do |student, row_idx|
  %w(name sex age).each_with_index do |name, col_idx|
    @worksheet.add_cell(row_idx, col_idx, student.__send__(name))
    end
  end
   @workbook.stream.read #バイナリーで値を取得
  # end
end
end
