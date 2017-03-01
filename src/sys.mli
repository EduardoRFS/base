(** Cross-platform system configuration values. *)


(** [interactive] is set to [true] when being executed in the [ocaml] REPL, and [false]
    otherwise. *)
val interactive : bool ref

(** [os_type] describes the operating system that the OCaml program is running on.  Its
    value is one of ["Unix"], ["Win32"], or ["Cygwin"] *)
val os_type : string

(** [unix] is [true] if [os_type = "Unix"]*)
val unix : bool

(** [win32] is [true] if [os_type = "Win32"]*)
val win32 : bool

(** [cygwin] is [true] if [os_type = "Cygwin"]*)
val cygwin : bool

(** [word_size_in_bits] is the number of bits in one word on the machine currently
    executing the OCaml program.  Generally speaking it will be either [32] or [64]. *)
val word_size_in_bits : int

(** [int_size_in_bits] is the number of bits in the [int] type.  Generally, on 32-bit
    platforms, its value will be [31], and on 64 bit platforms its value will be [63].
    When running in JavaScript, it will be [32]. *)
val int_size_in_bits : int

(** [big_endian] is true when the program is running on a big-endian architecture. *)
val big_endian : bool

(** [max_string_length] is the maximum allowed length of a [string] or [Bytes.t]. *)
val max_string_length : int

(** [max_array_length] is the maximum allowed length of an ['a array]. *)
val max_array_length : int

(** Return the name of the runtime variant the program is running on.  This is normally
    the argument given to [-runtime-variant] at compile time, but for byte-code it can be
    changed after compilation. *)
val runtime_variant : unit -> string

(** Return the value of the runtime parameters, in the same format as the contents of the
    [OCAMLRUNPARAM] environment variable. *)
val runtime_parameters : unit -> string

(** [ocaml_version] is the OCaml version with which the program was compiled.  It is a
    string of the form ["major.minor[.patchlevel][+additional-info]"], where major, minor,
    and patchlevel are integers, and additional-info is an arbitrary string.  The
    [[.patchlevel]] and [[+additional-info]] parts may be absent. *)
val ocaml_version : string

(** [enable_runtime_warnings bool] controls whether the OCaml runtime system should emit
    warnings.  Runtime warnings are enabled by default. *)
val enable_runtime_warnings : bool -> unit

(** [runtime_warnings_enabled ()] returns [true] when runtime warnings are enabled and
    [false] otherwise. *)
val runtime_warnings_enabled : unit -> bool

(** For the purposes of optimization, [opaque_identity] behaves like an unknown (and thus
    possibly side-effecting) function.  At runtime, [opaque_identity] disappears
    altogether.  A typical use of this function is to prevent pure computations from being
    optimized away in benchmarking loops.  For example:

    {[
      for _round = 1 to 100_000 do
        ignore (Sys.opaque_identity (my_pure_computation ()))
      done
    ]} *)
val opaque_identity : 'a -> 'a

