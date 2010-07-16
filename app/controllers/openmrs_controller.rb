class OpenmrsController < ApplicationController

  def test
    @locations = Context.locationService.allLocations
  end

end
