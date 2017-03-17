require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @property = Property.new(name: "Torre Calvin Ariel", address: "C/ Fabio Mota #9, Naco", price: 320000, sale: "En Venta", kind: "Apartamento", room: 4, bath: 4.0, parking: 3, location: "Naco", mts: 250, general: "Example text")
  end

  test "should be valid" do
    assert @property.valid?
  end

  test "name should be present" do
    @property.name = "   "
    assert_not @property.valid?
  end

  test "address should be present" do
    @property.address = "   "
    assert_not @property.valid?
  end

  test "price should be present" do
    @property.price = 0
    assert_not @property.nil?
  end

  test "sale should be present" do
    @property.sale = "   "
    assert_not @property.valid?
  end

  test "kind should be present" do
    @property.kind = "   "
    assert_not @property.valid?
  end

  test "room should be present" do
    @property.room = 0
    assert_not @property.nil?
  end

  test "bath should be present" do
    @property.bath = 0
    assert_not @property.nil?
  end

  test "parking should be present" do
    @property.parking = 0
    assert_not @property.nil?
  end

  test "location should be present" do
    @property.location = "   "
    assert_not @property.valid?
  end

  test "mts should be present" do
    @property.mts = 0
    assert_not @property.nil?
  end

  test "general should be present" do
    @property.general = "   "
    assert_not @property.valid?
  end
end
