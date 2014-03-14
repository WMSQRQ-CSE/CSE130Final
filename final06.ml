let ans = 
  let x = 10 in
  let f y = 
  	let a = x + 1 in
  	let b = y + a in
  	a + b in
  f 100

let ans = 
  let f n = 10 in
  let f n = if n > 0 then n + (f(n-1)) else 0 in
  f 5

let ans =
  let f g x = g (g x) in
  let h0 = fun x -> x * x in
  let h1 = f h0 in
  let h2 = f h1 in
  h2 2

let ans = 
  let f f = f + 1 in
  f

let ans = 
  let f x = x + 1 in
  f
(* 
let ans = 
  let f x = x + 1 in 
  x 
 *)

let ans f g x = 
	if x > 0 then f x else g x

(* Here's the previous code on the exam, which has compile error

let ans l = 
	match l with
	| [] -> []
	| (hx, hy) :: t -> (hx hy) :: (ans t)
since ans is not rec, ans will be unbound value
 *)
let rec ans l = 
	 match l with
	 | [] -> []
	 | (hx, hy)::t -> (hx hy) :: (ans t)

type 'a tree = Leaf of 'a | Node of 'a tree * 'a tree

let x = Node(Node(Leaf 1, Leaf 2), Node(Leaf 3, Leaf 4))

let rec tf f b t =
	match t with
	| Leaf x -> f (b,x)
	| Node(t1, t2) -> tf f (tf f b t1) t2

let to_list t = 
	let f (a, x) = x :: a in
	let b = [] in
	tf f b t


let size t = 
	let f (a, x) = a + 1 in
	let b = 0 in
	tf f b t

(* Tail-recursive*)
let rec tf f b t =
	let left =
	  match t with
	  | Leaf x -> f(b ,x)
	  | Node (t1, t2) -> tf f b t1
	in 
	  match t with
	  | Leaf x -> f(b, x)
	  | Node(t1, t2) -> tf f left t2

let to_list1 t = 
	let f (a, x) = x :: a in
	let b = [] in
	tf f b t


let size1 t = 
	let f (a, x) = a + 1 in
	let b = 0 in
	tf f b t
















