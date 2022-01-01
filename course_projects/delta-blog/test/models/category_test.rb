require 'test_helper'
class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.new(name:"Sports")
    end
    test "category should be valid" do
        assert @category.valid?
    end
    test "name should be present" do
        @category.name=" "
        assert_not @category.valid?
    end
    test "name should be unique" do
        @category.save
        @category2= Category.new(name:"Sports")
        assert_not @category2.valid?
    end
    test "name should not be to long" do
        @category.name = "d"*31
        assert_not @category.valid?
    end
    test "name should not be to short" do
        @category.name = "d"*2
        assert_not @category.valid?
    end

end