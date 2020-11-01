class Task < ApplicationRecord
  has_one :document

  def external_id
    create_response.dig('response','task_id') if create_response.is_a?(Hash)
  end

  def status
    get_response['response']['task']['state']
  end

  def get_response
    AnalyzeApi.new(document).get
  end

  def result
    @result ||= get_response['response']['result'] || {}
  end

  def time
    result['time']
  end

  def pages
    result['pages']
  end

  def label
    label_translation_dict[result['label']] rescue 'not ready'
  end

  def label_translation_dict
    {
     'doctype_tech_passport' => 'БТИ',
     'doctype_land_lease_contract' => 'ЗУ',
     'doctype_facility_into_operation_permission' => 'Разрешение на ввод',
     'doctype_building_permit' => 'Разрешение на строительство',
     'doctype_architectural_urban_planning_solutions' => 'Свид. АГР',
    }
  end
end
