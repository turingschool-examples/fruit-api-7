class FruitsController < ApplicationController
  def create
    @fruit = SearchFacade.new.fruit_named(params[:search])
  end
end
