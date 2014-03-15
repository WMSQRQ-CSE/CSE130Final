case class NumEx(e: Int) extends Throwable
trait A {
  def f(x: Int):Int
  def g(x:Int) :Int
}

class Hello extends A {
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
  def run {
    val r = List(0,1,2,3,4,5,6,7,8,9).map(foo)
    val ans = (c, r)
    print(ans)
  }
}
