class Employee < ApplicationRecord
    has_many  :locations
    mount_uploader :document, DocumentUploader

    enum :gender, {"male": 1, "female": 0 }
end
