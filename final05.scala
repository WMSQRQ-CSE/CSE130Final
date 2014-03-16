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

class A {
  def f : String = "A-" + this.g
  def g : String = throw new Exception
}

class B extends A {
  override def g : String = "B"
}
class C extends A {
  var y = 0
}
def foo(x: A): Any = {
  try{x.f}
  catch{case _ => ()}
}
val ans = (foo(new B), foo(new C))

def streamify[A, B] (f: A => List[B], xs: List[A]) : List[B] = {
  for (x <- xs; y <- f(x)) 
    yield y
}
