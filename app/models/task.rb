class Task < ApplicationRecord
  has_one :document

  def external_id
    create_response.dig('response','task_id') if create_response.is_a?(Hash)
  end

  def status
    get_response['response']['task']['state'] rescue nil
  end

  def get_response
    AnalyzeApi.new(document).get
  end

  def result
    @result ||= get_response['response']['result'] rescue { }
  end

  def time
    result['time']
  end

  def pages
    result['pages']
  end

  def label
    ClassificationType.find_by(slug: result['label'])&.name
  end
end
