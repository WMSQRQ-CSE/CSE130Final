var a = 10
def foo(x: Int) = {
  a = a + x
  a
}

val x = foo(10)
val ans = a + x

val a = Array(10)
def f(a: Array[Int], x: Int) = {
  a(0) = a(0) + x
  a(0)
}
val x = f(a, 10)
val ans = a(0) + x

class Vec[A](v:A, n: Int) {
  var data: List[A] = List()
  for(i <- 1 to n){
    data = data ++ List(v)
  }
}

val x = new Vec(2,2)
val y = new Vec(3,3)
val ans = (x.data, y.data)

case class NumEx(e: Int) extends Throwable
var c = 0
def f (x: Int) : Int = {
  c += 1
  if(x == 0) {throw NumEx(0)}
  val r = g(x-1)
  c -= 1
  r
}

def g(x: Int): Int = {
  c += 1
  if(x == 0) {throw NumEx(1)}
  val r = f(x-1)
  c += 1
  r
}

def foo(x: Int) = {
  try{ f(x) }
  catch{case NumEx(e) => e}
}

val r = List(0,1,2,3,4,5,6,7,8,9).map(foo)
val ans = (c, r)
