class AnalyzeApi
  API_ENDPOINT = 'http://79.175.11.66:60025/api/v1/'.freeze

  attr_reader :document, :is_base_operation, :category

  def initialize(document)
    @document = document
    @category = document.category
    @is_base_operation = @category.base == true
  end

  def post
    file = Tempfile.new(['hello', '.pdf'], :encoding => 'utf-8')
    file.open
    file.write(document.file.data.force_encoding('utf-8').encode)
    file.rewind

    request(
      http_method: :post,
      endpoint: 'classification',
      params: post_params(file),
    )
  ensure
    file.close
    file.unlink
  end

  def get
    request(
      http_method: :get,
      endpoint: "tasks/#{document.task.external_id}"
    )
  end

  private

  def post_params(file)
    if is_base_operation
      { }
    elsif category.user_label
      { user_label: category.slug }
    else
      { class_mode: category.slug }
    end.merge(
      file: Faraday::UploadIO.new(file.path, document.file.mime_type)
    )
  end

  def client
    @_client ||= Faraday.new(API_ENDPOINT) do |client|
      client.request :url_encoded
      client.request :multipart
      client.adapter Faraday.default_adapter
      client.headers['Content-Type'] = 'multipart/form-data'
    end
  end

  def request(http_method:, endpoint:, params: {})
    response = client.public_send(http_method, endpoint, params)
    JSON.parse(response.body)
  rescue Faraday::ConnectionFailed
    { connection: :failed, error: "апи недоступно" }
  rescue => e
    { error: e.message }
  end
end
