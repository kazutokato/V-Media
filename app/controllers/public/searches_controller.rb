class Public::SearchesController < ApplicationController
  def search
    @reviews = Review.search(params[:word])
  end
end
