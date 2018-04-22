require 'test_helper'

class TerminalsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "should get list of terminals" do
    get "/api/terminals", headers: {"Accept": "application/json"}
    assert_response :success
  end
  
  test "unkown path" do
    get "/api/terminalsasdasd", headers: {"Accept": "application/json"}
    assert_response 404
  end
  
  test "check if reponse content type is json by setting header" do
    get "/api/terminals", headers: {"Accept": "application/json"}
    assert_equal "application/json", @response.content_type
  end
  
  test "check if reponse content type is json using url" do
    get "/api/terminals.json"
    assert_equal "application/json", @response.content_type
  end
  
  test "check if reponse content type is xml by setting header" do
    get "/api/terminals", headers: {"Accept": "application/xml"}
    assert_equal "application/xml", @response.content_type
  end
  
  test "check if reponse content type is xml by using url" do
    get "/api/terminals.xml"
    assert_equal "application/xml", @response.content_type
  end
  
  test "should get specific terminal of specific id" do
    terminal = terminals(:terminal1)
    get "/api/terminals/"+terminal.id.to_s, headers: {"Accept": "application/json"}
    assert_response :success
    assert true
  end
  
  test "404 for terminal that does not exist" do
    get "/api/terminals/sadasd", headers: {"Accept": "application/json"}
    assert_response 404
    assert true
  end
  
  test "update name of test data" do
    terminal = terminals(:terminal1)
    
    new_data = Hash.new
    new_data[:name] = "test_terminal1"
    new_data[:description] = terminal.description
    new_data[:additional_info] = terminal.additional_info
    
    patch "/api/terminals/"+terminal.id.to_s, params: { terminal: { name: "test_terminal1", description: terminal.description } }, headers: {"Accept": "application/json"}
    assert_response :success
    
    get "/api/terminals/"+terminal.id.to_s, headers: {"Accept": "application/json"}
    assert_equal "test_terminal1", JSON.parse(@response.body)["name"]
    
  end
  
  test "create new terminal" do
    post "/api/terminals/", params: { terminal: { name: "test_terminal5", description: "test test test test", additional_info: { "key": "value", "key2": "value2", "key3": "value3" }}}, headers: {"Accept": "application/json"}
    assert_response :success    
  end
  
  test "delete terminal" do
    terminal = terminals(:terminal1)
    
    delete "/api/terminals/"+terminal.id.to_s, headers: {"Accept": "application/json"}
    assert_response :success
    
  end
  
  test "delete a terminal that does not exist should result in 400 code" do
    delete "/api/terminals/asdasd", headers: {"Accept": "application/json"}
    assert_response 400
    
  end
  
end
