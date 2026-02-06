"enum" @keyword.declaration
"struct" @keyword.declaration
"fun" @keyword.declaration
"egg" @keyword.declaration

"when" @keyword.control
"otherwise" @keyword.control
"range" @keyword.control
"spawn" @keyword.control
"with" @keyword.control
"in" @keyword.control

(type_identifier) @type

(enum_decl
  name: (type_identifier) @type.definition)

(struct_decl
  name: (type_identifier) @type.definition)

(identifier) @variable

(member_expression
  "." @punctuation.delimiter
  (identifier) @variable.other.member)

(function_decl
  name: (identifier) @function.definition)

(call_expression
  function: (identifier) @function.call)

(string) @string
(number) @number
(boolean) @constant.builtin
(nil) @constant.builtin


(comment) @comment
