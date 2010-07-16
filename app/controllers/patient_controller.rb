class PatientController < ApplicationController

  def view
    @patient = Context.patientService.getPatient(params[:id].to_i)
    puts "No patient found!" if (@patient == nil)
    @encounters = Context.encounterService.getEncountersByPatient(@patient)
  end

end
