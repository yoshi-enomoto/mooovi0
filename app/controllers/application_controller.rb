class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # サインアップ時、保存項目追加のための設定
  # 記載はDeviseコントローラーを継承したコントローラ、もしくはApplicationController。
  # ifオプションを指定して、before_actionを呼び出す条件を指定する。
  # （今回はコントローラの種類を指定する）
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 『devise_parameter_sanitizer』メソッドはDeviseのコントローラ以外で使用不可。
  # （deviseで追加されたメソッドの為）
  # すべてのコントローラがApplicationControllerを継承している為、
  # すべてのコントローラのアクションの前で『devise_parameter_sanitizer』メソッドが呼び出されてしまう。

  # 複数ページで部分テンプレートを使用時、呼び出しコントローラーによって表示内容を変える記述
  before_action :request_path
  def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
          str.map{|s| self.include?(s)}.include?(true)
      end
  end
  # このメソッドの定義結果は『:request_path』（シンボル型）
  # 『str.map{|s| self.include?(s)}』の実行内容が『:is』。

  # サインアウト後のリダイレクト先を設定
  # 引数には『resource』を渡す（deviseのメソッドを上書きしている為）
  # 返り値にリダイレクト先のURLを指定
  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  # サインアップ時、保存項目追加のための設定
  # 通常のストパラ同様、直接書かずに別途書く。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
  # devise_parameter_sanitizer.permit(追加したいメソッドの種類, keys: [追加したいパラメーター名])

    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
