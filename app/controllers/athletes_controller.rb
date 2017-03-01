class AthletesController < ApplicationController

  def show
    @model = Athlete.find(params[:id])
  end
end