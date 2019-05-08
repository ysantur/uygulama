class Kitap < ApplicationRecord
has_attached_file :resim, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :resim, content_type: /\Aimage\/.*\z/

belongs_to :user
has_one :like
end
