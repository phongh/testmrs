# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def format_date(date)
    use = Time.new
    use = Time.at(date.get_time/1000) if (date.class.name == 'Java::JavaSql::Timestamp')
    use.strftime("%d/%m/%Y");
  end

  def random_dom_id #for example for use on a div
    "id#{rand(10000)}"
  end

end
