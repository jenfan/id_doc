class Document < ApplicationRecord
  belongs_to :file, class_name: 'DocFile', foreign_key: 'doc_file_id', dependent: :destroy
  belongs_to :task, dependent: :destroy
end
