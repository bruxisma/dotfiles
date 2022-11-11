" Vim syntax file
" Language: C++17 esque additions
" Version: 0.1
"
" Provides syntax highlighting for the C++17 esque keywords as well as
" attributes. Mostly for modules and concepts

" Modules TS
syntax keyword cxxImport import module

" Coroutines TS
syntax keyword cxxKeyword co_await co_return co_yield

syntax match cxxAttribute "\<\(nodiscard\|noreturn\|carries_dependency\|fallthrough\|maybe_unused\|deprecated\)\>"
syntax match cxxAttribute "\<\(gnu\|clang\)::\i\+\>"

syntax match cxxConcept "\(\<concept bool\s\+\)\@<=\i\+\>"

" cCppString is from the vim runtime C++ syntax file
syntax region cxxAttributes start="\[\[" end="\]\]" contains=cxxAttribute,cCppString

highlight default link cxxAttribute StorageClass
highlight default link cxxStructure Structure
highlight default link cxxKeyword Statement
highlight default link cxxConcept Function
highlight default link cxxImport Include
