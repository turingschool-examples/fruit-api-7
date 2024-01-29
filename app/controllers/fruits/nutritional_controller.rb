module Fruits
  class NutritionalController < ApplicationController
    # GET /fruits/nutritional
    def index
      @related_fruits = SearchFacade.new.related_by_calories(params[:max_calories])
    end
  end
end
