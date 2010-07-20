class PatientViewed < ActiveRecord::Base
  
  def self.recently_viewed(user_id, n=5)
    all(:conditions => ["user_id = ?", user_id], :order => "created_at DESC", :limit => n )
  end
  
  def self.recently_viewed_ids(user_id, n=5)
    recently_viewed(user_id, n).collect { |pv| pv.patient_id }
  end
  
  def self.record_view(openmrsuser, openmrspatient)
    destroy_all({ :user_id => openmrsuser.user_id, :patient_id => openmrspatient.patient_id })
    create({ :user_id => openmrsuser.user_id, :patient_id => openmrspatient.patient_id })
  end
  
end
