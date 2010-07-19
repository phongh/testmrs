# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date(date, opts = {})
    use = Time.new
    use = Time.at(date.get_time/1000) if (date.class.name == 'Java::JavaSql::Timestamp')
    use.strftime("%d/%m/%Y");
  end

  def format(obj, opts = {})
    return "" if obj.nil?
    return format_person_name obj.person_name, opts if obj.java_kind_of? Java::org.openmrs.Person
    return format_person_name obj, opts if obj.java_kind_of? Java::org.openmrs.PersonName
    return format_identifier obj, opts if obj.java_kind_of? Java::org.openmrs.PatientIdentifier
    return format_metadata obj, opts if obj.java_kind_of? Java::org.openmrs.Location
    return format_metadata obj, opts if obj.java_kind_of? Java::org.openmrs.EncounterType
    return format_person_name obj.person.person_name, opts if obj.java_kind_of? Java::org.openmrs.User
    return format_date obj, opts if obj.java_kind_of? Java::java.sql.Timestamp
    "Unknown class for '#{obj}'<br/>ruby: #{obj.class}<br/>java: #{obj.java_class}"
  end
  
  def format_person_name(name, opts = {})
    "<span class=\"person-name\">#{name.family_name.upcase}, #{name.given_name}</span>"
  end

  def format_metadata(metadata, opts = {})
    "<span class=\"metadata\">#{metadata.name}</span>"
  end

  def format_identifier(identifier, opts = {})
    "<span class=\"metadata label\">#{identifier.identifier_type.name}:</span> <span class=\"data value\">#{identifier.identifier}</span>"
  end

  def random_dom_id #for example for use on a div
    "id#{rand(10000)}"
  end
  
  def safe_for_wire(obj)
    return "" if obj.nil?
    if obj.java_kind_of? Java::org.openmrs.Patient
      {
        :patient_id => obj.patient_id,
        :age => obj.age,
        :gender => obj.gender,
        :person_name => format(obj.person_name),
        :identifiers => obj.active_identifiers.collect { |i| format(i) }
      }
    else
      "Unhandled class: #{obj.java_class}"
    end
  end

end
