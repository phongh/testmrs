class PatientController < ApplicationController
  
  def view
    @patient = Context.patientService.getPatient(params[:id].to_i)
    if @patient.nil?
      puts "No patient found!"
      raise "No patient found!"
    end
    @encounters = Context.encounterService.getEncountersByPatient(@patient)
    # record that this user viewed this patient
    PatientViewed.record_view($omrs.authenticated_user, @patient)
  end
  
  def find
    ret = [];
    $omrs.patient_service.getPatients(params[:query]).each do |patient|
      ret << helpers.safe_for_wire(patient) 
    end
    render :json => ret
  end
  
end
