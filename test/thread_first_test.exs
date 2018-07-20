defmodule ThreadFirstTests do
  use ExUnit.Case
  require ThreadFirstMacros
  import ThreadFirstMacros

  test "thread1: HelloWorld" do
    result =
      thread_first do
        "hello world"
        String.split()
        Stream.map(&String.capitalize/1)
        Enum.join()
      end

    assert result == "HelloWorld"
  end

  test "thread2: single-line do block" do
    result =
      thread_first do
        "hello world"
      end

    assert result == "hello world"
  end

  test "thread3: a calculator" do
    result =
      thread_first do
        # piping into a unary operator is deprecated, please use the qualified name.
        # For example, Kernel.+(5), instead of +5

        42
        # 47
        Kernel.+(5)
        # 30
        Kernel.-(17)
        # remainder is 4
        rem(26)
      end

    assert 4 == result
  end
end
