let ans = 
  let x = 2 in
  let y = (let x = 20 in
              x * x
          )
          + x
  in
    y * x;;

let f g x y = g(x + y);;
(* let g = f (fun x -> List.tl x) 3;;
   Type error 
   let ans = g 7
 *)

let f g x y = g (x + y);;
let g = f (fun x -> x * x) 3;;
let ans = g 7;;

let f x y = x + y;;
let g = f 10;;
let f x y = x * y;;
let ans = g 10;;

let rec ru(f, g, base) = 
  if (g base) then ru (f, g, (f base))
  else base

let rec reverse l =
  let f (h::tl, r) = (tl, h::r) in
  let g (x, r) = List.length(r) <> List.length(l) in
  let base = (l, []) in
  let (_, r) = ru(f, g, base) in
  r

let b = 10;;
let a = b;;
let x = a + 1 in
let y = b + 2 in
2*x + 3*y;;


let y = b + 2 in
let x = a + 1 in
2*x + 3*y




