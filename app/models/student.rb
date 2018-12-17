class Student < ApplicationRecord
  #学生
  belongs_to :department #学生は１つの学部に所属している

  def self.import(file)
    workbook = RubyXL::Parser.parse(file.path)
    worksheet = workbook[0] #初めのシートを読み込み
    len = Student.all.length
    i = 500

    #ループ開始
    for cnt in 1..i
      read_row = worksheet[cnt] #cntで１〜カウント
      if worksheet.sheet_data.rows[cnt] == nil #値がnilのtrを通る場合にbreak
        break
      end
      target_key = Student.where(name: read_row[0].value).first #保存ターゲットのパラメーター取得
        unless target_key.nil?
          binding.pry
          if read_row[2] == nil #読み込みデータが空の場合
            return "#{cnt}行目エラー"
          end
          target_key.age = read_row[2].value
        end
      target_key.save!
    end
    return
    #ループ停止
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

    student_row = %w(氏名 EMAIL 生年月日) #ヘッダーを作成
     student_row.each_with_index do |val, row_idx|
       @worksheet.add_cell(0, row_idx, val)
     end

    @students_val = %w(name sex age) #DBの値を取得
    students.each.with_index(1) do |student, row_idx|
      @students_val.each_with_index do |name, col_idx|
    @worksheet.add_cell(row_idx, col_idx, student.__send__(name))
    end
  end
   @workbook.stream.read #バイナリーで値を取得
  # end
end
end
