class Public::RanksController < ApplicationController
  def index
    # いいね数順に第三位までのレビューのIDを取得する
    @all_ranks = Review.find(Favorite.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end

end
