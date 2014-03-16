let ans = 
  let rec foo n f x =
    if n <= 0 then x else foo (n-1) f (f x) in
  foo 100 (fun y -> y + 1) 0

let ans = 
  let foo = 
    let x = 1 in
      (fun y -> let x = x + y in x) in
  (foo 100, foo 1000)

let ans = 
  let rec foo xs ys = 
    match xs, ys with
    | x::xs', y::ys' -> (x,y) :: (foo xs' ys')
    | _, _ -> [] in
  foo [1;2;3] ["a";"b"]

type mix = Int of int | Bool of bool
let ans = 
    let foo x = 
      match x with
      | 0 -> Bool true
      | -1 -> Bool false
      | _ -> Int x in
    foo 12

let ans = 
  let f g = fun x -> g (g x) in
  let h = f f (fun x -> x * 10) in
  h 1

let ans x = 
  match x with
  | -2 -> Bool false
  | -1 -> Bool true
  | _  -> Int x

let ans f g x =
  if f x then x else g x

let rec ans n f x = 
  if n <= 0 then x else ans (n-1) f (f x)

let ans b g f =
  (fun x -> (if b then f else g) x)

let rec ans x ys = 
  match ys with
  | [] -> x
  | y::ys' -> ans (y x) ys'

let rec fac x =
  if x <= 1 then 1 else x * fac(x-1)

let fac1 x = 
  let rec helper total x =
    if x <= 1 then total
    else helper (total*x) (x-1)
  in helper 1 x

let rec map f xs = 
  match xs with
  | [] -> []
  | x::xs' -> (f x) :: (map f xs')

let map1 f xs =
  let rec helper acc f xs = 
    match xs with
    | [] -> List.rev acc
    | x::xs' -> helper ((f x) :: acc) f xs'
  in helper [] f xs

let rec foldr f xs b =
  match xs with
  | [] -> b
  | x::xs' -> f x(foldr f xs' b)

let foldl f xs acc =
  let rec helper acc f xs =
    match xs with
    | [] -> acc
    | x::xs' -> helper (f x acc) f xs'
  in helper acc f xs
