(* a: Not well typed, rev t return a list, cannot use con operator
let rec rev l = 
  match l with
  | [] -> []
  | (h::t) -> (rev t) :: h
 *)

(* b
 * Type error: List.hd expect a list not an 'a type
let rec f l = 
  match l with
  | [] -> []
  | (h::t) -> (List.hd h) :: t
 *)

(* Unbound record field h 
let rec f (tup, l) =
  match l with
  | [] -> 0
  | (h::t) -> tup.h + f (tup, t)
 *)

(* c *)
let rec f (tup, l) = 
  match l with
  | [] -> 0
  | (h::t) -> h + f(tup, t)

(* 'a * int list -> int *)

(* d 
let rec f (x, y) = 
  if x then (List.hd y) + 20
  else if not x then 0 else y
 *)
(* type error, expression has type int list but was expected of type int *)

(* e, original has syntax error
 * let rec f l =
   * match l with
   * | [] -> []
   * | f(h::t) -> h @ (flatten t)
   *)
let rec f l =
  match l with
  | [] -> []
  | h::t -> h @ (List.flatten t)
(* 'a list list -> 'a list = <fun> *)

(* Not tail recursive *)
let rec map f l =
  match l with
  | [] -> []
  | (h::t) -> (f h) :: (map f t)
(* Type: ('a -> 'b) -> 'a list -> 'b list *)

let mapTR f l =
  let rec helper acc l =
    match l with
    | [] -> List.rev acc
    | (h::t) -> helper ((f h) :: acc) t
  in helper [] l

(* Tail recurisve *)
let rec fold f b l =
  match l with
  | [] -> b
  | (h::t) -> fold f (f (h,b)) t
(* type: ('a * 'b -> 'b) -> 'b -> 'a list -> 'b = <fun> *)

let rec len l = 
  match l with
  | [] -> 0
  | (h::t) -> 1 + len t
(* Not tail recursive *)
(* Type: 'a list -> int = <fun> *)

(* Type error: can't match tuple and list 
let rec f (n, l) = 
  match l with
  | [] -> n
  | (n, h::t) -> if (h > n) then f (h, t) else f(n, t)
*)
let rec f (n, l) = 
  match l with
  | [] -> n
  | h::t -> if (h > n) then f (h, t) else f(n, t)
(* Tail recursive *)
(* Type: ('a * 'a list) -> 'a *)

