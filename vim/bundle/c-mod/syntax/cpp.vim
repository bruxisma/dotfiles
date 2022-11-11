" Vim Syntax File
" Language: C++ 11 Standard (and some not standard :X) functions, constants,
"           and keywords.
" Maintainer: Tres Walsh
" Initial Version: 2011-OCT-29 (0.1)

" Keywords
syntax keyword std_keyword static_assert
syntax keyword std_keyword constexpr
syntax keyword std_keyword decltype
syntax keyword std_keyword alignof
syntax keyword std_keyword alignas
syntax keyword std_keyword auto

" storage modifiers
syntax keyword std_storage override
syntax keyword std_storage final

" types
syntax keyword std_type nullptr

" etc.
syntax keyword std_operator noexcept

" personal extensions
syntax keyword ext_storage restrict

" link words here
hi def link std_storage StorageClass
hi def link std_operator Operator
hi def link std_keyword Statement
hi def link std_type Type

hi def link ext_storage StorageClass
