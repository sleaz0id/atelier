class CustomField < ApplicationRecord
  belongs_to :item
  belongs_to :field_type
end
