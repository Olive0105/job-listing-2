class ApplicationController < ActionController::Base
  #before_action :authenticate_user! #改成這樣，表示在所有動作之前，都要檢查使用者的登入狀態。

  #before_action :require_is_admin

  def require_is_admin
    if !current_user || !current_user.admin? #多加一個 OR 判斷條件「未登入的使用者」

      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end
end
