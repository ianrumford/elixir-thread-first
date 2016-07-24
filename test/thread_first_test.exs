defmodule ThreadFirstTests do
use ExUnit.Case
require ThreadFirstMacros
import ThreadFirstMacros
test "thread1: HelloWorld" do

  result = thread_first do
    "hello world" 
    String.split 
    Stream.map(&String.capitalize/1) 
    Enum.join
  end

  assert result == "HelloWorld"

end
test "thread2: single-line do block" do

  result = thread_first do
    "hello world" 
  end

  assert result == "hello world" 

end
test "thread3: a calculator" do

  result = thread_first do

    42
    + 5 # 47
    - 17 # 30
    rem 26 # remainder is 4 
    
  end
  
  assert 4 == result 
  
end
end
