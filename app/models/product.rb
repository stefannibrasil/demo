class Product < ApplicationRecord
  has_one_attached :image

  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validate :image_format
  validate :image_size

  private

  def image_format
    if image.attached? && !image.attachment.blob.content_type.in?(%w(image/png image/jpeg image/jpg))
      errors.add(:image, ' must be an image file')
      throw :abort
    end
  end

  def image_size
    if image.attached? && image.blob.byte_size > 5.megabytes
      errors.add(:image, ' is too big')
      throw :abort
    end
  end
end
