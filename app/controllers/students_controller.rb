class StudentsController < ApplicationController
  require 'rubyXL'
  def index
    @q = Student.ransack(params[:q])
    @departments = Department.all
    @students = @q.result(distinct: true)
    excel_dl_format #indexでExcelのダウンロードを扱う為、設定した定義を読み込む
    template_rubyxl
    # hogehoge = {"name" => "hogei", "age" => "28"}
    #
    # render :json =>hogehoge
  end

  # Excel_DLフォーマット
    def excel_dl_format
      respond_to do |format|
        format.html
          format.xlsx do
            send_data Student.to_xlsx(@students),#indexの@studentsをsendしている
            filename: "生徒一覧.xlsx".encode(Encoding::Windows_31J)
          end
      end
    end

  def search
    @q = Student.search(search_params) #studentをサーチ
    @students = @q.result(distinct: true) #重複しないものを抽出

  end

  def import
    # binding.pry
    if params[:file].blank?
      redirect_to root_path
      flash[:alert] = "ファイルを選択してください"
    else
      Student.import(params[:file]) #アップロードファイルを渡す
      redirect_to root_path, notice: "登録しました"
    end
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def template_rubyxl
    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]
    worksheet.add_cell(0, 1, 'B1セル')

    # セルに文字を追加
# cell = worksheet.add_cell(0, 1, 'B1')
# # フォントを変更
# cell.change_font_name '梅明朝'
# # フォントサイズを変更
# cell.change_font_size 20
# # フォントの色を変更
# cell.change_font_color 'ff0000'
# # セルの色を変更
# cell.change_fill '00ff00'

    #罫線
    i = 500
    y = ++1
    for cnt in 1..i
    cell = worksheet.add_cell(cnt, 0, 'te')
    cell = worksheet.add_cell(cnt, 1, '')
    cell = worksheet.add_cell(cnt, 2, '')
    cell = worksheet.add_cell(cnt, 3, 'd')
    cell = worksheet.add_cell(cnt, 4, '')
    cell = worksheet.add_cell(cnt, 5, '')
    cell = worksheet.add_cell(cnt, 6, '')
    cell = worksheet.add_cell(0, 7, '')
    cell = worksheet.add_cell(0, 8, '')
    cell = worksheet.add_cell(0, 9, '')
    cell = worksheet.add_cell(0, 10, '')
    cell = worksheet.add_cell(0, 11, '')
    cell = worksheet.add_cell(0, 12, '')
    cell = worksheet.add_cell(0, 13, '')
    cell = worksheet.add_cell(0, 14, '')
    cell = worksheet.add_cell(0, 15, '')
    cell = worksheet.add_cell(0, 16, '')
    cell = worksheet.add_cell(0, 17, '')
    cell = worksheet.add_cell(0, 18, '')
    cell = worksheet.add_cell(0, 19, '')
    cell = worksheet.add_cell(0, 20, '')
    cell = worksheet.add_cell(0, 21, '')
    cell = worksheet.add_cell(0, 22, '')
    cell = worksheet.add_cell(0, 23, '')
    cell = worksheet.add_cell(0, 24, '')
    cell = worksheet.add_cell(0, 25, '')
    cell = worksheet.add_cell(0, 26, '')
    cell = worksheet.add_cell(0, 27, '')
    cell = worksheet.add_cell(0, 28, '')
    cell = worksheet.add_cell(0, 29, '')
    cell = worksheet.add_cell(0, 30, '')
  end

    workbook.write('sample.xlsx')
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
