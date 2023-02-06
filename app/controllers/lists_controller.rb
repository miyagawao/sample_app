class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #データをデータベースに保存するためのSaveメソッド実行
    list.save
    #トップ画面へリダイレクト
    redirect_to '/top'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
