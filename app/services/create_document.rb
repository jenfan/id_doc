class CreateDocument
  def self.call(params)
    new(params).call
  end

  attr_reader :params, :document

  def initialize(params)
    @params = params
  end

  def call
    ActiveRecord::Base.transaction do
      @doc_file = create_file
      @task = Task.create!
      @document = Document.create!(file: @doc_file, task: @task)
    end
    send_file_for_analyze
    @document
  end

  private

  def send_file_for_analyze
    response = AnalyzeApi.new(document).post
    @task.update(create_response: response)
  end

  def create_file
    DocFile.create!(
      data: params[:data].read,
      filename: params[:data].original_filename,
      mime_type: params[:data].content_type,
    )
  end
end

