" Vim Syntax File
" Language: C Standard (and some not standard :X) functions and constants
" Maintainer: Tres Walsh
" Initial Version: 2010-FEB-16 (0.1)

" assert.h
syntax keyword std_constant assert

" complex.h
syntax keyword std_function cabs
syntax keyword std_function carg
syntax keyword std_function ccos
syntax keyword std_function cexp
syntax keyword std_function clog
syntax keyword std_function conj
syntax keyword std_function cpow
syntax keyword std_function csin
syntax keyword std_function ctan
syntax keyword std_function ccosh
syntax keyword std_function cimag
syntax keyword std_function csinh
syntax keyword std_function csqrt
syntax keyword std_function cproj
syntax keyword std_function creal
syntax keyword std_function ctanh
syntax keyword std_function casin
syntax keyword std_function catan
syntax keyword std_function cacos
syntax keyword std_function cacosh
syntax keyword std_function catanh
syntax keyword std_function casinh

" ctype.h
syntax keyword std_function isalnum
syntax keyword std_function isalpha
syntax keyword std_function isblank
syntax keyword std_function iscntrl
syntax keyword std_function isdigit
syntax keyword std_function isgraph
syntax keyword std_function islower
syntax keyword std_function isprint
syntax keyword std_function ispunct
syntax keyword std_function isspace
syntax keyword std_function isupper
syntax keyword std_function isxdigit

syntax keyword std_function tolower
syntax keyword std_function toupper

syntax keyword ext_function isascii
syntax keyword ext_function toascii

" errno.h
syntax keyword std_constant errno

" fenv.h
syntax keyword std_type fexcept_t
syntax keyword std_type fenv_t

syntax keyword std_function fegetenv
syntax keyword std_function fesetenv
syntax keyword std_function feclearexcept
syntax keyword std_function fegetexceptflag
syntax keyword std_function fesetexceptflags
syntax keyword std_function fegetround
syntax keyword std_function fesetround
syntax keyword std_function feupdateenv
syntax keyword std_function fetestexcept
syntax keyword std_function feholdexcept
syntax keyword std_function feraiseexcept

" float.h
" Nothing needed

" inttypes.h
" Nothing needed

" iso646.h
syntax keyword std_conditional or
syntax keyword std_conditional not
syntax keyword std_conditional xor
syntax keyword std_conditional and
syntax keyword std_conditional compl
syntax keyword std_conditional bitor
syntax keyword std_conditional or_eq
syntax keyword std_conditional not_eq
syntax keyword std_conditional xor_eq
syntax keyword std_conditional and_eq
syntax keyword std_conditional bitand

" limits.h
" Nothing needed

" locale.h
syntax keyword std_type lconv

syntax keyword std_function localeconv
syntax keyword std_function setlocale

" math.h
" TODO: Fill it out

" setjmp.h
syntax keyword std_function setjmp
syntax keyword std_function longjmp

" signal.h
syntax keyword std_function raise
syntax keyword ext_function psignal

" stdarg.h
syntax keyword std_function va_arg
syntax keyword std_function va_end
syntax keyword std_function va_copy
syntax keyword std_function va_start

" stdbool.h
" Nothing needed

" stddef.h
syntax keyword std_function offsetof

" stdint.h
" Nothing needed

" stdio.h
syntax keyword std_error gets

" string.h
syntax keyword std_function memcpy
syntax keyword std_function memchr
syntax keyword std_function memcmp
syntax keyword std_function memset
syntax keyword std_function memmove

syntax keyword ext_function memccpy
syntax keyword ext_function mempcpy

syntax keyword std_function strspn
syntax keyword std_function strlen
syntax keyword std_function strcat
syntax keyword std_function strcpy
syntax keyword std_function strcmp
syntax keyword std_function strstr
syntax keyword std_function strtok
syntax keyword std_function strchr
syntax keyword std_function strrchr
syntax keyword std_function strxfrm
syntax keyword std_function strpbrk
syntax keyword std_function strcspn
syntax keyword std_function strncat
syntax keyword std_function strncpy
syntax keyword std_function strncmp
syntax keyword std_function strcoll
syntax keyword std_function strerror

syntax keyword ext_function strdup
syntax keyword ext_function strcat_s
syntax keyword ext_function strcpy_s
syntax keyword ext_function strtok_r
syntax keyword ext_function strsignal
syntax keyword ext_function strerror_r

hi def link ext_conditional Conditional
hi def link ext_constant Constant
hi def link ext_function Function
hi def link ext_type Type

hi def link std_conditional Conditional
hi def link std_constant Constant
hi def link std_function Function
hi def link std_error Error
hi def link std_type Type
