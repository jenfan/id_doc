class Task < ApplicationRecord
  has_one :document

  def external_id
    create_response.dig('response','task_id') if create_response.is_a?(Hash)
  end

  def get_response
    response = AnalyzeApi.new(self.document).get
    update(get_response: response)
    super
  end
end
