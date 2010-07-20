class WelcomeController < ApplicationController

  def index
    recently_viewed_ids = PatientViewed.recently_viewed_ids $omrs.authenticated_user.user_id
    @recently_viewed = get_patient_list recently_viewed_ids
  end

end
