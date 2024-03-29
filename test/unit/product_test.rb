require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attribute must not be empty" do 
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any? 
  	
  end
  test "product price must be positive" do

  	product = Product.new(:title => "My book Title",
  						   :description => "My book description",
  						   :image_url => "abc.jpg"	)
  	product.price = -1
  	assert product.invalid?
  	assert_equal "must be greater than 0 or equal to 0.01",
  	  product.errors[:price].join('; ')

  	product.price = 0
  	
  	assert product.invalid?
  	assert_equal "must be greater than 0 or equal to 0.01",  
  	  product.errors[:price].join('; ')

  	product.price =1
  	assert product.valid?  
  end
end
