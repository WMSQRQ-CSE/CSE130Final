def permutations[A](xs: List[A]) : Iterator[List[A]] =
  xs match{
    case Nil => Iterator(Nil)
    case x::rest => {
      def slices[A](l : List[A]) =
        for(i <- 0 to l.length) yield (l.slice(0,i), l.slice(i, l.length))
      for(r <- permutations(rest); (a, b) <- slices(r))
        yield (a ++ List(x) ++ b)
    }
  }

def permutations1[A](xs: List[A]) :  Iterator[List[A]] = 
  xs match {
    case Nil => Iterator(Nil)
    case x::rest => {
      for(r <- permutations(rest); i <- 0 to r.length)
        yield(r.slice(0,i)++ List(x) ++ r.slice(i, r.length))
    }
  }

val x = Array(1,2,3)
val y = Array("a", "b", "c")
def f (y: Any){
  val x = y
}

val z = f(x)
val ans = x(0)

/*def f(x:Int) : Int => Int = {
  def g(y: Int) = {
    a(x + y)
  }
  g
}
val a :Int => Int = f(10)
val ans = a(0)*/

val a = Array(0)

def f(x: Int) = {
  val a: Array[Int] = Array(10)
  val g = (y:Int) => { a(0) += (x + y)
                       a(0) }
  g
}
val foo = f(10)
val tmp = foo(1000)
val ans = (a(0), foo(1))

trait A {
  var x : List[String] = List()
  def d() : Unit
  def a() {
    x  = x ++ List("a")
    d()
  }
}

trait B extends A {
  def b(){
    x = x ++ List("b")
  }
}

trait C extends A {
  def c(){
    x = x ++ List("c")
  }
}

class D extends B with C {
  def d(){
    x = x ++ List("d")
    b()
    c()
  }
}

val o = new D
val tmp = o.a
val ans = o.x

def foo(n: Int) = {
  var xs: List[Int] = List()
  var i = 1
  while( i <= n ) {
    xs = i :: xs
    i += i
  }
  xs
}
var ans = 0
for (i <- foo(10)) {
  ans += i
}

def elementAndRest[A](xs: List[A]): Iterator[(A, List[A])] = {
  val iter = xs.iterator
  for( i <- iter;
    x = i;
    y = xs.filter(x => x != i)
  ) yield(x, y)
}

for (t <- elementAndRest(List(1,2,3,4,5))) println(t)


trait A {
  val a: Any
}
trait B {
  val a: Int
  val b: Int
}
trait C {
  def f(x:B): A
}
