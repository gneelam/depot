class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  default_scope :order => 'title'	
  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_refrenced_by_any_line_item
  private

  #ensure there there are no line items referencing this element
  def ensure_not_refrenced_by_any_line_item
  	if line_items.empty?
      return true
    else
      errors.add(:base,'Line Items Present')
      return false
  	end
  end

  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to =>0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
  	:with => %r{\.(gif|jpg|png)$}i,
  	:message => 'Must be url for GIF, JPG or PNG image'
  }
end
