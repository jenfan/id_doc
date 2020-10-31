class AnalyzeApi
  API_ENDPOINT = 'http://79.175.11.66:60045/api/v1/'.freeze

  attr_reader :document

  def initialize(document)
    @document = document
  end

  def post
    file = Tempfile.new
    file.write("hello world")
    request(
      http_method: :post,
      endpoint: 'classification',
      params: { file: Faraday::UploadIO.new(file.path, document.file.mime_type) },
    )
  ensure
    file.unlink
  end

  def get
    request(
      http_method: :get,
      endpoint: "tasks/#{document.task.external_id}"
    )
  end

  private

  private

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
    return 404 if response.status == 404
    JSON.parse(response.body)
  rescue Faraday::ConnectionFailed
    { connection: :failed, error: "апи недоступно" }
  rescue => e
    { error: e.message }
  end
end

# '011f3d34-1a8b-4fe5-9bd9-f84dc60b9f9a'
