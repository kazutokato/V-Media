# frozen_string_literal: true

module Public
  class SearchesController < ApplicationController
    def search
      @reviews = Review.search(params[:word])
    end
  end
end
