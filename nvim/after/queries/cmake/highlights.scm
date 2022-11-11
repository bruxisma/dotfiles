(normal_command
  (argument) @constant.builtin (#any-of? @constant.builtin "CMAKE_MODULE_PATH"))

(normal_command
  (identifier) @function.builtin (#match? @function.builtin "\\c^(cmake_language)$")
  ((argument) @keyword.operator (#eq? @keyword.operator "CALL")
   . (argument) @parameter ; Should be @paramter *or* @function. depends on variable or not
   . (argument)* @parameter)
)

(normal_command (identifier) @function.builtin (#match? @function.builtin "\\c^include$") . (argument) @include)

(normal_command (identifier) @function.builtin (#match? @function.builtin "\\c^include$")
  (argument) @constant.builtin (#eq? @constant.builtin "RESULT_VARIABLE") . (argument))

(normal_command (identifier) @function.builtin (#match? @function.builtin "\\c^include$")
  (argument) @constant.builtin (#any-of? @constant.builtin "OPTIONAL" "NO_POLICY_SCOPE"))

(normal_command (identifier) @function.builtin (#match? @function.builtin "\\c^list$")
  (argument) @keyword.operator
    (#any-of? @keyword.operator
      "LENGTH"
      "GET"
      "JOIN"
      "SUBLIST"
      "FIND"
      "APPEND"
      ;"FILTER"
      "INSERT"
      "POP_BACK"
      "POP_FRONT"
      "PREPEND"
      "REMOVE_ITEM"
      "REMOVE_AT"
      "REMOVE_DUPLICATES"
      ;"TRANSFORM"
      "REVERSE"
      "SORT"))
