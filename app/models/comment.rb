class Comment < ApplicationRecord
  belongs_to :haberler
  belongs_to :user
end
