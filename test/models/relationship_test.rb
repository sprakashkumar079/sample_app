require "test_helper"
=begin
 This is RelationshipTest class which is use for testing of Relationship model.
=end
class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  #this is set-up method .
  def setup
    @relationship = Relationship.new(follower_id: users(:michael).id,
                                     followed_id: users(:archer).id)
  end

  #should be valid
  test "should be valid" do
    assert @relationship.valid?
  end

  #should require a follower_id
  test "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  #should require a followed_id
  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
