require 'test_helper'

class TerminalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save terminal without name and description" do
    terminal = Terminal.new
    assert_not terminal.save
  end
  
  test "should not save terminal without name" do
    terminal = Terminal.new(description: "This is a test description text")
    assert_not terminal.save 
  end
  
  test "should not save terminal without description" do
    terminal = Terminal.new(name: "test_terminal1")
    assert_not terminal.save 
  end
  
  test "should save terminal when name and description is set and additional_info not set" do
    terminal = Terminal.new(name: "test_terminal1", description: "This is a test description text")
    assert terminal.save
  end
  
  test "should save terminal when name, description and additional_info is set" do
    additional_info_data = { time: "00:02:00", date: "2018-04-21", place: "albany"}
    terminal = Terminal.new(name: "test_terminal1", description: "This is a test description text", additional_info: additional_info_data)
    assert terminal.save 
  end
  
end
