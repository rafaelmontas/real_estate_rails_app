# require 'test_helper'
#
# class PhotosControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @property = properties(:one)
#     @photo = photos(:one)
#   end
#
#   test "should get index" do
#     get property_photos_url(@property)
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_property_photo_url(@property)
#     assert_response :success
#   end
#
#   test "should create photo" do
#     assert_difference('Photo.count') do
#       post property_photos_url(@property), params: { photo: { image_data: @photo.image_data } }
#     end
#
#     assert_redirected_to property_photo_url(Photo.last)
#   end
#
#   test "should show photo" do
#     get property_photo_url(@property, @photo)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_property_photo_url(@property, @photo)
#     assert_response :success
#   end
#
#   test "should update photo" do
#     patch property_photo_url(@photo), params: { photo: { image_data: @photo.image_data } }
#     assert_redirected_to property_photo_url(@photo)
#   end
#
#   test "should destroy photo" do
#     assert_difference('Photo.count', -1) do
#       delete property_photo_url(@property, @photo)
#     end
#
#     assert_redirected_to property_photos_url
#   end
# end
