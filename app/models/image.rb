class Image < ApplicationRecord
	belongs_to :album

	validates :name, :description, {presence: true}
	has_attached_file :image, styles: { large: "1000x1000>", medium: "300x300>"}, default_url: "/app/assets/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
 	do_not_validate_attachment_file_type :image
end
