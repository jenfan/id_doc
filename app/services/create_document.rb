class CreateDocument
  def self.call(params)
    new(params).call
  end

  attr_reader :params, :document, :category_slug

  def initialize(params)
    @params = params
    @document = Document.new
    @category_slug = params[:category] == 'user' ? params[:manual_category] : params[:category]
  end

  def call
    return [@document, false] unless valid?
    ActiveRecord::Base.transaction do
      @doc_file = create_file
      @task = Task.create!
      @document.update!(
        file: @doc_file,
        task: @task,
        category: ClassificationType.find_by_slug!(category_slug)
      )
    end
    send_file_for_analyze

    [@document, true]
  end

  private

  def send_file_for_analyze
    response = AnalyzeApi.new(document).post
    @document.task.update(create_response: response)
  end

  def create_file
    DocFile.create!(
      data: params[:data].read,
      filename: params[:data].original_filename,
      mime_type: params[:data].content_type,
    )
  end

  def valid?
    return true if params[:data].present? && category_slug.present?

    document.errors.add(:file, 'Выберите файл') if params[:data].blank?
    document.errors.add(:type, 'Выберите тип классификации') if category_slug.blank?
    false
  end
end

