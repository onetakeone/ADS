class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def new
  end
  
  def create
  end

  def destroy
  end

end