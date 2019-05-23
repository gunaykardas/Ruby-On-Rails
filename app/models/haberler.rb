class Haberler < ApplicationRecord
       has_attached_file :resim, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
        validates_attachment_content_type :resim, content_type: /\Aimage\/.*\z/
     has_many :comments, dependent: :destroy  
end
