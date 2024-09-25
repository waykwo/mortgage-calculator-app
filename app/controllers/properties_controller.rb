class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render :index
  end
end
