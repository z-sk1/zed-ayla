(keyword: $ => choice(
  "egg",
  "rock",
  "fun",
  "type",
  "struct",
  "enum",
  "int",
  "float",
  "string",
  "bool",
  "thing",
  "map",
  "ayla",
  "elen",
  "four",
  "why",
  "back",
  "kitkat",
  "next",
  "decide",
  "when",
  "otherwise",
  "spawn",
  "with",
  "it",
  "in",
  "range"
)) @keyword

(boolean) @constant.builtin
(nil) @constant.builtin

; Types
(type_identifier) @type
(struct_decl
  name: (type_identifier) @type.definition)

; Functions
(function_decl
  name: (identifier) @function.definition)

(call_expression
  function: (identifier) @function.call)

; Variables
(identifier) @variable
(member_expression
  property: (identifier) @variable.other.member)

; Literals
(string) @string
(number) @number

; Comments
(comment) @comment
