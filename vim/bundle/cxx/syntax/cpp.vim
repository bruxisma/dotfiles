" Vim Syntax File
" Language: C++ 11 Standard (and some not standard :X) functions, constants,
"           and keywords.
" Maintainer: Tres Walsh
" Initial Version: 2011-OCT-29 (0.1)
" Updated: 2012-OCT-19 (0.2)
" Note: To have vim not mark a lambda as an error when passed into
"       a function place `let c_no_curly_error = 1` within your .vimrc or
"       .gvimrc file.

" Keywords
syntax keyword std_keyword auto

" operators
syntax keyword std_operator decltype
syntax keyword std_operator noexcept
syntax keyword std_operator alignas
syntax keyword std_operator alignof

" statements
syntax keyword std_statement static_assert
syntax keyword std_statement constexpr

" storage modifiers
syntax keyword std_storage_class thread_local
syntax keyword std_storage_class override
syntax keyword std_storage_class final

" types
syntax keyword std_constant nullptr

" personal extensions
syntax keyword ext_storage __attribute__
syntax keyword ext_storage __declspec
syntax keyword ext_storage restrict

" link words here
hi def link std_storage_class StorageClass
hi def link std_statement Statement
hi def link std_operator  Operator
hi def link std_constant  Constant
hi def link std_keyword   Keyword
hi def link std_type      Type

hi def link ext_storage StorageClass
