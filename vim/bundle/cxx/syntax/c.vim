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

" stdatomic.h
" TODO: add all typedefs

syntax keyword std_constant __STDC_NO_ATOMICS__

" TODO: syntax keyword std_constant memory_order

syntax keyword std_type atomic_flag

syntax keyword std_function atomic_flag_test_and_set_explicit
syntax keyword std_function atomic_flag_and_set

syntax keyword std_function atomic_flag_clear_explicit
syntax keyword std_function atomic_flag_clear

syntax keyword std_function atomic_is_lock_free
syntax keyword std_function atomic_init

syntax keyword std_function atomic_store_explicit
syntax keyword std_function atomic_store

syntax keyword std_function atomic_compare_exchange_strong_explicit
syntax keyword std_function atomic_compare_exchange_weak_explicit
syntax keyword std_function atomic_exchange_explicit
syntax keyword std_function atomic_compare_exchange_strong
syntax keyword std_function atomic_compare_exchange_weak
syntax keyword std_function atomic_fetch_add_explicit
syntax keyword std_function atomic_fetch_sub_explicit
syntax keyword std_function atomic_fetch_or_explicit
syntax keyword std_function atomic_fetch_xor_explicit
syntax keyword std_function atomic_fetch_and_explicit
syntax keyword std_function atomic_thread_fence
syntax keyword std_function atomic_signal_fence
syntax keyword std_function atomic_fetch_and
syntax keyword std_function atomic_fetch_xor
syntax keyword std_function atomic_fetch_sub
syntax keyword std_function atomic_fetch_add
syntax keyword std_function atomic_fetch_or
syntax keyword std_function atomic_exchange

" stdbool.h
" Nothing needed

" stddef.h
syntax keyword std_function offsetof

" stdint.h
" Nothing needed

" stdio.h
syntax keyword std_error gets

syntax keyword std_function fclose
syntax keyword std_function fopen
syntax keyword std_function freopen
syntax keyword std_function remove
syntax keyword std_function rename
syntax keyword std_function rewind
syntax keyword std_function tmpfile
syntax keyword std_function clearerr
syntax keyword std_function feof
syntax keyword std_function ferror
syntax keyword std_function fflush
syntax keyword std_function fgetpos
syntax keyword std_function fgetc
syntax keyword std_function fgets
syntax keyword std_function fputc
syntax keyword std_function fputs
syntax keyword std_function ftell
syntax keyword std_function fseek
syntax keyword std_function fsetpos
syntax keyword std_function fread
syntax keyword std_function fwrite
syntax keyword std_function getc
syntax keyword std_function getchar
syntax keyword std_function printf
syntax keyword std_function vprintf
syntax keyword std_function fprintf
syntax keyword std_function vfprintf
syntax keyword std_function sprintf
syntax keyword std_function snprintf
syntax keyword std_function vsprintf
syntax keyword std_function vnsprintf
syntax keyword std_function perror
syntax keyword std_function putc
syntax keyword std_function putchar
syntax keyword std_function scanf
syntax keyword std_function vscanf
syntax keyword std_function fscanf
syntax keyword std_function vfscanf
syntax keyword std_function sscanf
syntax keyword std_function vsscanf
syntax keyword std_function setbuf
syntax keyword std_function setvbuf
syntax keyword std_function tmpnam
syntax keyword std_function ungetc
syntax keyword std_function puts

" stdlib.h
syntax keyword std_function atof
syntax keyword std_function atoi
syntax keyword std_function atol
syntax keyword std_function strtod
syntax keyword std_function strol
syntax keyword std_function strtoul
syntax keyword std_function strtoll
syntax keyword std_function strtoull

syntax keyword std_function rand
syntax keyword std_function random
syntax keyword std_function srand
syntax keyword std_function srandom

syntax keyword std_function malloc
syntax keyword std_function calloc
syntax keyword std_function realloc
syntax keyword std_function free

syntax keyword std_function abort
syntax keyword std_function atexit
syntax keyword std_function getenv
syntax keyword std_function system

syntax keyword std_function bsearch
syntax keyword std_function max
syntax keyword std_function min
syntax keyword std_function qsort

syntax keyword std_function abs
syntax keyword std_function fabs
syntax keyword std_function labs
syntax keyword std_function div
syntax keyword std_function ldiv

syntax keyword std_function mblen
syntax keyword std_function mbtowc
syntax keyword std_function mbstowcs
syntax keyword std_function wctomb
syntax keyword std_function wcstombs

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

" threads.h
syntax keyword std_constant __STDC_NO_THREADS__

" threads
syntax keyword std_type thrd_start_t
syntax keyword std_type thrd_t

syntax keyword std_constant thrd_success
syntax keyword std_constant thrd_timedout
syntax keyword std_constant thrd_busy
syntax keyword std_constant thrd_nomem
syntax keyword std_constant thrd_error

syntax keyword std_function thrd_create
syntax keyword std_function thrd_equal
syntax keyword std_function thrd_current
syntax keyword std_function thrd_sleep
syntax keyword std_function thrd_yield
syntax keyword std_function thrd_exit
syntax keyword std_function thrd_detach
syntax keyword std_function thrd_join

" call once
syntax keyword std_type once_flag
syntax keyword std_constant ONCE_FLAG_INIT
syntax keyword std_function call_once

" mutual exclusion
syntax keyword std_type mtx_t

syntax keyword std_function mtx_init
syntax keyword std_function mtx_lock
syntax keyword std_function mtx_timedlock
syntax keyword std_function mtx_trylock
syntax keyword std_function mtx_unlock
syntax keyword std_function mtx_destroy

syntax keyword std_constant mtx_recursive
syntax keyword std_constant mtx_plain
syntax keyword std_constant mtx_timed

" condition variable
syntax keyword std_type cnd_t

syntax keyword std_function cnd_init
syntax keyword std_function cnd_signal
syntax keyword std_function cnd_broadcast
syntax keyword std_function cnd_wait
syntax keyword std_function cnd_timedwait
syntax keyword std_function cnd_destroy

" thread-local storage
syntax keyword std_constant TSS_DTOR_ITERATIONS
syntax keyword std_type tss_dtor_t
syntax keyword std_type tss_t

syntax keyword std_function tss_create
syntax keyword std_function tss_delete
syntax keyword std_function tss_set
syntax keyword std_function tss_get

" time.h
syntax keyword std_function asctime
syntax keyword std_function clock
syntax keyword std_function ctime
syntax keyword std_function difftime
syntax keyword std_function gmtime
syntax keyword std_function gmtime_r
syntax keyword std_function localtime
syntax keyword std_function mktime
syntax keyword std_function time
syntax keyword std_function strftime
syntax keyword std_function strptime
syntax keyword std_function timegm

syntax keyword ext_function asctime_r
syntax keyword ext_function ctime_r

" wchar.h
syntax keyword std_function wcscmp
syntax keyword std_function wcsncmp
syntax keyword std_function wcscasecmp
syntax keyword std_function wcsncasecmp

" wctype.h
syntax keyword std_function iswalnum
syntax keyword std_function iswalpha
syntax keyword std_function iswblank
syntax keyword std_function iswcntrl
syntax keyword std_function iswctype
syntax keyword std_function iswdigit
syntax keyword std_function iswgraph
syntax keyword std_function iswlower
syntax keyword std_function iswprint
syntax keyword std_function iswpunct
syntax keyword std_function iswspace
syntax keyword std_function iswupper
syntax keyword std_function iswxdigit
syntax keyword std_function towlower
syntax keyword std_function towupper
syntax keyword std_function towctrans

" link word here
hi def link ext_conditional Conditional
hi def link ext_constant Constant
hi def link ext_function Function
hi def link ext_type Type

hi def link std_conditional Conditional
hi def link std_constant Constant
hi def link std_function Function
hi def link std_error Error
hi def link std_type Type
