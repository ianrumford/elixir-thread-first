defmodule ThreadFirstMacros do
defmacro thread_first(args) do

  # get the statements' asts from the do block
  [first_ast | rest_asts] = args
  # fetch the :do key
  |> Keyword.fetch!(:do)
  |> case do

       # if the do block has multiple statements it will be a __block__
       # and the statements' asts will be its args
       {:__block__, _, args} -> args

       # if only one statement in the do block the value of the :do:
       # key will be the statement's ast
       ast -> [ast]
           
     end

  # now use Macro.pipe to thread all the statements' asts together
  # and return the threaded ast
  rest_asts
  |> Enum.reduce(first_ast,
  fn rest_ast, this_ast ->
    # insert this_ast as the 0th argument of rest_ast
    Macro.pipe(this_ast, rest_ast, 0)
  end)

end

end
