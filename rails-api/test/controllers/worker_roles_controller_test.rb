require 'test_helper'

class WorkerRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worker_role = worker_roles(:one)
  end

  test "should get index" do
    get worker_roles_url, as: :json
    assert_response :success
  end

  test "should create worker_role" do
    assert_difference('WorkerRole.count') do
      post worker_roles_url, params: { worker_role: { role_id: @worker_role.role_id, worker_id: @worker_role.worker_id } }, as: :json
    end

    assert_response 201
  end

  test "should show worker_role" do
    get worker_role_url(@worker_role), as: :json
    assert_response :success
  end

  test "should update worker_role" do
    patch worker_role_url(@worker_role), params: { worker_role: { role_id: @worker_role.role_id, worker_id: @worker_role.worker_id } }, as: :json
    assert_response 200
  end

  test "should destroy worker_role" do
    assert_difference('WorkerRole.count', -1) do
      delete worker_role_url(@worker_role), as: :json
    end

    assert_response 204
  end
end
