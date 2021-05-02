class MemosController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create # どうやらこの記述が必要

    # #案1 　ノーマル
    # def create_params
    #   params.permit(:text)
    # end

    # def create
    #   memo = Memo.new(text: params[:text])
    #   # エラー処理
    #   unless memo.save # もし、memoが保存できなかったら
    #     @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
    #   end
    # end

    # 案2　ハッシュとして保存することでMemo.new(create_params)で勝手にcreateできちゃうね。
    def create_params
      params.permit(:text)
    end

    def create
      memo = Memo.new(create_params)
      unless memo.save # もし、memoが保存できなかったら
        @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
      end
    end


  end
