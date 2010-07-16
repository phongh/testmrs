class QueryController < ApplicationController

  def find_patient
    ret = []
    Context.patient_service.getPatients(params[:term]).each do |p|
      label = "#{p.person_name.to_s}"
      if p.patient_identifier then
        label << "<br/><small>#{p.patient_identifier.identifier_type.name}:#{p.patient_identifier.identifier}</small>"
      end
      ret << { :label => label , :value => p.person_id }
    end
    render :json => ret
  end

end
