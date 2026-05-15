; Variables
(identifier) @variable
(member_expression
  property: (identifier) @variable.other.member)

(operator) @operator

(boolean) @constant.builtin
(nil) @constant.builtin

; Types
(primitive_type) @type.builtin
(type_identifier) @type

; Structs
(struct_decl
  name: (type_identifier) @type.definition)

(struct_field
  name: (identifier) @variable.other.member)

(struct_field
  type: (type_identifier) @type)

(struct_field
  type: (primitive_type) @type.builtin)

; Functions
(function_decl
  "fun" @keyword)

(function_decl
  name: (identifier) @function.definition)

(parameter
    name: (identifier) @variable.parameter)

(parameter
    type: (primitive_type) @type.builtin)

(parameter
    type: (type_identifier) @type)

(call_expression
  function: (identifier) @function.call)

(receiver
  name: (identifier) @variable.parameter)

(receiver
  type: (type_identifier) @type)

(return_type
  type: (type_identifier) @type)

(return_type
  type: (primitive_type) @type.builtin)

; Literals
(string) @string
(number) @number

; Comments
(comment) @comment

(
  (identifier) @keyword
  (#match? @keyword "^(say|keep|import|type|struct|enum|interface|ayla|elen|choose|select|when|otherwise|with|map|fun|give|defer|start|chan|int|float|string|bool|for|range|while|snap|next|yes|no|nil)")
)
