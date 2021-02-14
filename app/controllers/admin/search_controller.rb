class Admin::SearchController < ApplicationController

  def search
    @range = params[:range]

    if @range == "レビュー"
      @reviews = Review.looks(params[:word])
    elsif @range == "ユーザー"
      @end_users = EndUser.looks(params[:word])
    else
      @contacts = Contact.looks(params[:word])
    end
  end

end
