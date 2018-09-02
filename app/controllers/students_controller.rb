class StudentsController < ApplicationController
  def index
    @q = Student.ransack(params[:q])
    @departments = Department.all
    @students = @q.result(distinct: true)
    excel_dl_format #indexでExcelのダウンロードを扱う為、設定した定義を読み込む
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
    Student.import(params[:file]) #アップロードファイルを渡す
    redirect_to root_url, notice: "Products imported."
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
