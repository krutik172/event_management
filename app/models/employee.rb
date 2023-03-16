class Employee < ApplicationRecord
    has_many  :locations
    accepts_nested_attributes_for :locations
    mount_uploader :document, DocumentUploader

    enum :gender, {"male": 1, "female": 0 }
end
