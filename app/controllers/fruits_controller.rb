class FruitsController < ApplicationController
  def index
    @fruit = SearchFacade.new.fruit_named(params[:query])
  end

  def create
    @fruit = SearchFacade.new.fruit_named(params[:search])
  end
end
