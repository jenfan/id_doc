class DocFilesController < ApplicationController
  def show
    @doc_file = DocFile.find(params[:id])
    send_data(
      @doc_file.data,
      :type => @doc_file.mime_type,
      :filename => "#{@doc_file.filename}.jpg",
      :disposition => "inline"
    )
  end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:doc_file).permit(:data)
    end
end
