;; extends

([(variable) (argument)] @symbol (#match? @symbol "^CMAKE_\\h+$"))
(variable) @constant

;(normal_command
;  (argument) @symbol
;    (#any-of? @builtin
;      "PROJECT_BINARY_DIR"
;      "PROJECT_DESCRIPTION"
;      "PROJECT_HOMEPAGE_URL"
;      "PROJECT_IS_TOP_LEVEL"
;      "PROJECT_NAME"
;      "PROJECT_SOURCE_DIR"
;      "PROJECT_VERSION"
;      "PROJECT_VERSION_MAJOR"
;      "PROJECT_VERSION_MINOR"
;      "PROJECT_VERSION_PATCH"
;      "PROJECT_VERSION_TWEAK"))

(normal_command
  (argument) @symbol
    (#match? @symbol "^\\h+_(BINARY_DIR|SOURCE_DIR|DESCRIPTION|HOMEPAGE_URL|IS_TOP_LEVEL)$"))

(normal_command
  (identifier) @function.builtin (#match? @function.builtin "\\c^(cmake_language)$")
  ((argument) @keyword.operator (#eq? @keyword.operator "CALL")
   . (argument) @parameter ; Should be @paramter *or* @function. depends on variable or not
   . (argument)*))

(normal_command
  (identifier) @keyword.function (#match? @keyword.function "\\c^cmake_minimum_required$")
  . (argument) @parameter (#eq? @keyword.operator "VERSION")
  . (argument) @number)

(normal_command
  (identifier) @function.builtin (#match? @function.builtin "\\c^project$"))

(normal_command
  (identifier) @function.builtin (#match? @function.builtin "\\c^find_package$"))

(normal_command
  (identifier) @function.builtin
    (#match? @function.builtin "\\c^include$") . (argument) @include)

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
      "FILTER"
      "INSERT"
      "POP_BACK"
      "POP_FRONT"
      "PREPEND"
      "REMOVE_ITEM"
      "REMOVE_AT"
      "REMOVE_DUPLICATES"
      "TRANSFORM"
      "REVERSE"
      "SORT"))
