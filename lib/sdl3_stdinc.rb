# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  INVALID_UNICODE_CODEPOINT = 0xFFFD

  # Enum


  # Typedef

  typedef :char, :Sint8
  typedef :uchar, :Uint8
  typedef :short, :Sint16
  typedef :ushort, :Uint16
  typedef :int, :Sint32
  typedef :uint, :Uint32
  typedef :long_long, :Sint64
  typedef :ulong_long, :Uint64
  typedef :long_long, :SDL_Time
  callback :SDL_malloc_func, [:ulong_long], :pointer
  callback :SDL_calloc_func, [:ulong_long, :ulong_long], :pointer
  callback :SDL_realloc_func, [:pointer, :ulong_long], :pointer
  callback :SDL_free_func, [:pointer], :void
  callback :SDL_CompareCallback, [:pointer, :pointer], :int
  callback :SDL_CompareCallback_r, [:pointer, :pointer, :pointer], :int
  typedef :pointer, :SDL_iconv_t
  callback :SDL_FunctionPointer, [], :void

  # Struct

  class Alignment_test < FFI::Struct
    layout(
      :a, :uchar,
      :b, :pointer,
    )
  end


  # Function

  def self.setup_stdinc_symbols(output_error = false)
    entries = [
      [:malloc, :SDL_malloc, [:ulong_long], :pointer],
      [:calloc, :SDL_calloc, [:ulong_long, :ulong_long], :pointer],
      [:realloc, :SDL_realloc, [:pointer, :ulong_long], :pointer],
      [:free, :SDL_free, [:pointer], :void],
      [:GetOriginalMemoryFunctions, :SDL_GetOriginalMemoryFunctions, [:pointer, :pointer, :pointer, :pointer], :void],
      [:GetMemoryFunctions, :SDL_GetMemoryFunctions, [:pointer, :pointer, :pointer, :pointer], :void],
      [:SetMemoryFunctions, :SDL_SetMemoryFunctions, [:SDL_malloc_func, :SDL_calloc_func, :SDL_realloc_func, :SDL_free_func], :bool],
      [:aligned_alloc, :SDL_aligned_alloc, [:ulong_long, :ulong_long], :pointer],
      [:aligned_free, :SDL_aligned_free, [:pointer], :void],
      [:GetNumAllocations, :SDL_GetNumAllocations, [], :int],
      [:GetEnvironment, :SDL_GetEnvironment, [], :pointer],
      [:CreateEnvironment, :SDL_CreateEnvironment, [:bool], :pointer],
      [:GetEnvironmentVariable, :SDL_GetEnvironmentVariable, [:pointer, :pointer], :pointer],
      [:GetEnvironmentVariables, :SDL_GetEnvironmentVariables, [:pointer], :pointer],
      [:SetEnvironmentVariable, :SDL_SetEnvironmentVariable, [:pointer, :pointer, :pointer, :bool], :bool],
      [:UnsetEnvironmentVariable, :SDL_UnsetEnvironmentVariable, [:pointer, :pointer], :bool],
      [:DestroyEnvironment, :SDL_DestroyEnvironment, [:pointer], :void],
      [:getenv, :SDL_getenv, [:pointer], :pointer],
      [:getenv_unsafe, :SDL_getenv_unsafe, [:pointer], :pointer],
      [:setenv_unsafe, :SDL_setenv_unsafe, [:pointer, :pointer, :int], :int],
      [:unsetenv_unsafe, :SDL_unsetenv_unsafe, [:pointer], :int],
      [:qsort, :SDL_qsort, [:pointer, :ulong_long, :ulong_long, :SDL_CompareCallback], :void],
      [:bsearch, :SDL_bsearch, [:pointer, :pointer, :ulong_long, :ulong_long, :SDL_CompareCallback], :pointer],
      [:qsort_r, :SDL_qsort_r, [:pointer, :ulong_long, :ulong_long, :SDL_CompareCallback_r, :pointer], :void],
      [:bsearch_r, :SDL_bsearch_r, [:pointer, :pointer, :ulong_long, :ulong_long, :SDL_CompareCallback_r, :pointer], :pointer],
      [:abs, :SDL_abs, [:int], :int],
      [:isalpha, :SDL_isalpha, [:int], :int],
      [:isalnum, :SDL_isalnum, [:int], :int],
      [:isblank, :SDL_isblank, [:int], :int],
      [:iscntrl, :SDL_iscntrl, [:int], :int],
      [:isdigit, :SDL_isdigit, [:int], :int],
      [:isxdigit, :SDL_isxdigit, [:int], :int],
      [:ispunct, :SDL_ispunct, [:int], :int],
      [:isspace, :SDL_isspace, [:int], :int],
      [:isupper, :SDL_isupper, [:int], :int],
      [:islower, :SDL_islower, [:int], :int],
      [:isprint, :SDL_isprint, [:int], :int],
      [:isgraph, :SDL_isgraph, [:int], :int],
      [:toupper, :SDL_toupper, [:int], :int],
      [:tolower, :SDL_tolower, [:int], :int],
      [:crc16, :SDL_crc16, [:ushort, :pointer, :ulong_long], :ushort],
      [:crc32, :SDL_crc32, [:uint, :pointer, :ulong_long], :uint],
      [:murmur3_32, :SDL_murmur3_32, [:pointer, :ulong_long, :uint], :uint],
      [:memcpy, :SDL_memcpy, [:pointer, :pointer, :ulong_long], :pointer],
      [:memmove, :SDL_memmove, [:pointer, :pointer, :ulong_long], :pointer],
      [:memset, :SDL_memset, [:pointer, :int, :ulong_long], :pointer],
      [:memcmp, :SDL_memcmp, [:pointer, :pointer, :ulong_long], :int],
      [:wcslen, :SDL_wcslen, [:pointer], :ulong_long],
      [:wcsnlen, :SDL_wcsnlen, [:pointer, :ulong_long], :ulong_long],
      [:wcslcpy, :SDL_wcslcpy, [:pointer, :pointer, :ulong_long], :ulong_long],
      [:wcslcat, :SDL_wcslcat, [:pointer, :pointer, :ulong_long], :ulong_long],
      [:wcsdup, :SDL_wcsdup, [:pointer], :pointer],
      [:wcsstr, :SDL_wcsstr, [:pointer, :pointer], :pointer],
      [:wcsnstr, :SDL_wcsnstr, [:pointer, :pointer, :ulong_long], :pointer],
      [:wcscmp, :SDL_wcscmp, [:pointer, :pointer], :int],
      [:wcsncmp, :SDL_wcsncmp, [:pointer, :pointer, :ulong_long], :int],
      [:wcscasecmp, :SDL_wcscasecmp, [:pointer, :pointer], :int],
      [:wcsncasecmp, :SDL_wcsncasecmp, [:pointer, :pointer, :ulong_long], :int],
      [:wcstol, :SDL_wcstol, [:pointer, :pointer, :int], :long],
      [:strlen, :SDL_strlen, [:pointer], :ulong_long],
      [:strnlen, :SDL_strnlen, [:pointer, :ulong_long], :ulong_long],
      [:strlcpy, :SDL_strlcpy, [:pointer, :pointer, :ulong_long], :ulong_long],
      [:utf8strlcpy, :SDL_utf8strlcpy, [:pointer, :pointer, :ulong_long], :ulong_long],
      [:strlcat, :SDL_strlcat, [:pointer, :pointer, :ulong_long], :ulong_long],
      [:strdup, :SDL_strdup, [:pointer], :pointer],
      [:strndup, :SDL_strndup, [:pointer, :ulong_long], :pointer],
      [:strrev, :SDL_strrev, [:pointer], :pointer],
      [:strupr, :SDL_strupr, [:pointer], :pointer],
      [:strlwr, :SDL_strlwr, [:pointer], :pointer],
      [:strchr, :SDL_strchr, [:pointer, :int], :pointer],
      [:strrchr, :SDL_strrchr, [:pointer, :int], :pointer],
      [:strstr, :SDL_strstr, [:pointer, :pointer], :pointer],
      [:strnstr, :SDL_strnstr, [:pointer, :pointer, :ulong_long], :pointer],
      [:strcasestr, :SDL_strcasestr, [:pointer, :pointer], :pointer],
      [:strtok_r, :SDL_strtok_r, [:pointer, :pointer, :pointer], :pointer],
      [:utf8strlen, :SDL_utf8strlen, [:pointer], :ulong_long],
      [:utf8strnlen, :SDL_utf8strnlen, [:pointer, :ulong_long], :ulong_long],
      [:itoa, :SDL_itoa, [:int, :pointer, :int], :pointer],
      [:uitoa, :SDL_uitoa, [:uint, :pointer, :int], :pointer],
      [:ltoa, :SDL_ltoa, [:long, :pointer, :int], :pointer],
      [:ultoa, :SDL_ultoa, [:ulong, :pointer, :int], :pointer],
      [:lltoa, :SDL_lltoa, [:long_long, :pointer, :int], :pointer],
      [:ulltoa, :SDL_ulltoa, [:ulong_long, :pointer, :int], :pointer],
      [:atoi, :SDL_atoi, [:pointer], :int],
      [:atof, :SDL_atof, [:pointer], :double],
      [:strtol, :SDL_strtol, [:pointer, :pointer, :int], :long],
      [:strtoul, :SDL_strtoul, [:pointer, :pointer, :int], :ulong],
      [:strtoll, :SDL_strtoll, [:pointer, :pointer, :int], :long_long],
      [:strtoull, :SDL_strtoull, [:pointer, :pointer, :int], :ulong_long],
      [:strtod, :SDL_strtod, [:pointer, :pointer], :double],
      [:strcmp, :SDL_strcmp, [:pointer, :pointer], :int],
      [:strncmp, :SDL_strncmp, [:pointer, :pointer, :ulong_long], :int],
      [:strcasecmp, :SDL_strcasecmp, [:pointer, :pointer], :int],
      [:strncasecmp, :SDL_strncasecmp, [:pointer, :pointer, :ulong_long], :int],
      [:strpbrk, :SDL_strpbrk, [:pointer, :pointer], :pointer],
      [:StepUTF8, :SDL_StepUTF8, [:pointer, :pointer], :uint],
      [:StepBackUTF8, :SDL_StepBackUTF8, [:pointer, :pointer], :uint],
      [:UCS4ToUTF8, :SDL_UCS4ToUTF8, [:uint, :pointer], :pointer],
      [:sscanf, :SDL_sscanf, [:pointer, :pointer], :int],
      [:vsscanf, :SDL_vsscanf, [:pointer, :pointer, :pointer], :int],
      [:snprintf, :SDL_snprintf, [:pointer, :ulong_long, :pointer], :int],
      [:swprintf, :SDL_swprintf, [:pointer, :ulong_long, :pointer], :int],
      [:vsnprintf, :SDL_vsnprintf, [:pointer, :ulong_long, :pointer, :pointer], :int],
      [:vswprintf, :SDL_vswprintf, [:pointer, :ulong_long, :pointer, :pointer], :int],
      [:asprintf, :SDL_asprintf, [:pointer, :pointer], :int],
      [:vasprintf, :SDL_vasprintf, [:pointer, :pointer, :pointer], :int],
      [:srand, :SDL_srand, [:ulong_long], :void],
      [:rand, :SDL_rand, [:int], :int],
      [:randf, :SDL_randf, [], :float],
      [:rand_bits, :SDL_rand_bits, [], :uint],
      [:rand_r, :SDL_rand_r, [:pointer, :int], :int],
      [:randf_r, :SDL_randf_r, [:pointer], :float],
      [:rand_bits_r, :SDL_rand_bits_r, [:pointer], :uint],
      [:acos, :SDL_acos, [:double], :double],
      [:acosf, :SDL_acosf, [:float], :float],
      [:asin, :SDL_asin, [:double], :double],
      [:asinf, :SDL_asinf, [:float], :float],
      [:atan, :SDL_atan, [:double], :double],
      [:atanf, :SDL_atanf, [:float], :float],
      [:atan2, :SDL_atan2, [:double, :double], :double],
      [:atan2f, :SDL_atan2f, [:float, :float], :float],
      [:ceil, :SDL_ceil, [:double], :double],
      [:ceilf, :SDL_ceilf, [:float], :float],
      [:copysign, :SDL_copysign, [:double, :double], :double],
      [:copysignf, :SDL_copysignf, [:float, :float], :float],
      [:cos, :SDL_cos, [:double], :double],
      [:cosf, :SDL_cosf, [:float], :float],
      [:exp, :SDL_exp, [:double], :double],
      [:expf, :SDL_expf, [:float], :float],
      [:fabs, :SDL_fabs, [:double], :double],
      [:fabsf, :SDL_fabsf, [:float], :float],
      [:floor, :SDL_floor, [:double], :double],
      [:floorf, :SDL_floorf, [:float], :float],
      [:trunc, :SDL_trunc, [:double], :double],
      [:truncf, :SDL_truncf, [:float], :float],
      [:fmod, :SDL_fmod, [:double, :double], :double],
      [:fmodf, :SDL_fmodf, [:float, :float], :float],
      [:isinf, :SDL_isinf, [:double], :int],
      [:isinff, :SDL_isinff, [:float], :int],
      [:isnan, :SDL_isnan, [:double], :int],
      [:isnanf, :SDL_isnanf, [:float], :int],
      [:log, :SDL_log, [:double], :double],
      [:logf, :SDL_logf, [:float], :float],
      [:log10, :SDL_log10, [:double], :double],
      [:log10f, :SDL_log10f, [:float], :float],
      [:modf, :SDL_modf, [:double, :pointer], :double],
      [:modff, :SDL_modff, [:float, :pointer], :float],
      [:pow, :SDL_pow, [:double, :double], :double],
      [:powf, :SDL_powf, [:float, :float], :float],
      [:round, :SDL_round, [:double], :double],
      [:roundf, :SDL_roundf, [:float], :float],
      [:lround, :SDL_lround, [:double], :long],
      [:lroundf, :SDL_lroundf, [:float], :long],
      [:scalbn, :SDL_scalbn, [:double, :int], :double],
      [:scalbnf, :SDL_scalbnf, [:float, :int], :float],
      [:sin, :SDL_sin, [:double], :double],
      [:sinf, :SDL_sinf, [:float], :float],
      [:sqrt, :SDL_sqrt, [:double], :double],
      [:sqrtf, :SDL_sqrtf, [:float], :float],
      [:tan, :SDL_tan, [:double], :double],
      [:tanf, :SDL_tanf, [:float], :float],
      [:iconv_open, :SDL_iconv_open, [:pointer, :pointer], :pointer],
      [:iconv_close, :SDL_iconv_close, [:pointer], :int],
      [:iconv, :SDL_iconv, [:pointer, :pointer, :pointer, :pointer, :pointer], :ulong_long],
      [:iconv_string, :SDL_iconv_string, [:pointer, :pointer, :pointer, :ulong_long], :pointer],
      [:size_mul_check_overflow, :SDL_size_mul_check_overflow, [:ulong_long, :ulong_long, :pointer], :bool],
      [:size_mul_check_overflow_builtin, :SDL_size_mul_check_overflow_builtin, [:ulong_long, :ulong_long, :pointer], :bool],
      [:size_add_check_overflow, :SDL_size_add_check_overflow, [:ulong_long, :ulong_long, :pointer], :bool],
      [:size_add_check_overflow_builtin, :SDL_size_add_check_overflow_builtin, [:ulong_long, :ulong_long, :pointer], :bool],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

