module.exports = grammar({
  name: "ayla",

  extras: ($) => [/\s/, $.comment],

  word: ($) => $.identifier,

  rules: {
    source_file: ($) => repeat($._statement),

    _statement: ($) =>
      choice(
        $.enum_decl,
        $.struct_decl,
        $.function_decl,
        $.var_decl,
        $.expression,
      ),

    enum_decl: ($) =>
      seq("enum", $.type_identifier, "{", repeat($.identifier), "}"),

    struct_decl: ($) =>
      seq("struct", $.type_identifier, "{", repeat($.struct_field), "}"),

    struct_field: ($) => seq($.identifier, $.type_identifier),

    function_decl: ($) =>
      seq("fun", $.identifier, "(", optional($.parameter_list), ")", $.block),

    var_decl: ($) =>
      seq("egg", $.identifier, optional($.type_identifier), "=", $.expression),

    expression: ($) =>
      choice(
        $.call_expression,
        $.member_expression,
        $.identifier,
        $.number,
        $.string,
        $.boolean,
        $.nil,
      ),

    call_expression: ($) =>
      seq($.identifier, "(", optional($.argument_list), ")"),

    member_expression: ($) => seq($.expression, ".", $.identifier),

    argument_list: ($) => seq($.expression, repeat(seq(",", $.expression))),

    parameter_list: ($) => seq($.identifier, repeat(seq(",", $.identifier))),

    block: ($) => seq("{", repeat($._statement), "}"),

    identifier: ($) => /[a-z_][a-zA-Z0-9_]*/,
    type_identifier: ($) => /[A-Z][a-zA-Z0-9_]*/,

    number: ($) => /\d+/,
    string: ($) => /"[^"]*"/,

    boolean: ($) => choice("yes", "no"),
    nil: ($) => "nil",

    comment: ($) =>
      choice(
        token(seq("//", /.*/)),
        token(seq("/*", /[^*]*\*+([^/*][^*]*\*+)*/, "/")),
      ),
  },
});
