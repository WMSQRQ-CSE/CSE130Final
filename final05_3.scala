trait A {
  def f(y: A) : Unit
}
trait C extends A {
  def g(y: C) : A
}
class B extends A {
  val x : Int = 0
  def f(y: A) {return}
}
class D extends B with C {
  def g(y: C) : A = {
    return this
  }
}
/* Can't type checked. C doesn't have member x
def foo(c: C) : Int = {
  return c.x
}
*/
