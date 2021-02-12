# frozen_string_literal: true

module Admin
  class ReviewCategoriesController < ApplicationController
    def index
      @medium_new = Medium.new
      @feature_new = Feature.new
      @genre_new = Genre.new
      @media = Medium.all
      @features = Feature.all
      @genres = Genre.all
    end
  end
end
