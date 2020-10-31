class Document < ApplicationRecord
  belongs_to :file, class_name: 'DocFile', foreign_key: 'doc_file_id'
  belongs_to :task
end
