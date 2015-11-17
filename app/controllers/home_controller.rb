class HomeController < ApplicationController
  def top
    if user_signed_in?
    @note = Note.new
    @notes = Note.all.order(created_at: :desc)
    else
      @message = "ようこそPorterへ！"
    end
  end

  def about
  end
end
