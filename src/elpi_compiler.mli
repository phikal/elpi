(* elpi: embedded lambda prolog interpreter                                  *)
(* license: GNU Lesser General Public License Version 2.1 or later           *)
(* ------------------------------------------------------------------------- *)

open Elpi_util
open Elpi_data

val program_of_ast : ?print:[`Yes|`Raw] -> Elpi_ast.decl list -> program
val query_of_ast : program -> Elpi_ast.goal -> query
val term_of_ast : depth:int -> Elpi_ast.term -> term

type quotation = depth:int -> ExtState.t -> string -> ExtState.t * term
val set_default_quotation : quotation -> unit
val register_named_quotation : string -> quotation -> unit

val lp : quotation

val is_Arg : ExtState.t -> term -> bool
val fresh_Arg : ExtState.t -> name_hint:string -> ExtState.t * term

(* Quotes the program and the query, see elpi_quoted_syntax.elpi *)
val quote_syntax : program -> query -> term * term

val typecheck : ?extra_checker:string list -> program -> query -> unit