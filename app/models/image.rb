class Image < ApplicationRecord
	belongs_to :album

	validates :name, :description, {presence: true}
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
