syntax keyword genexprKeyword if else for while break continue

syntax match genexprOperator /\<n\?eqp\?\>/
syntax match genexprOperator /\<\(l\|g\)te\?p\?\>/

syntax keyword genexprOperator bool not and or xor

syntax match genexprIdentifier /\<\(in\|out\)\([1-9]\d\)\?\>/

highlight default link genexprIdentifier Identifier

highlight default link genexprOperator Operator
highlight default link genexprKeyword Keyword
