class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # サインアウト後のリダイレクト先を設定
  # 引数には『resource』を渡す（deviseのメソッドを上書きしている為）
  # 返り値にリダイレクト先のURLを指定
  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end
end
