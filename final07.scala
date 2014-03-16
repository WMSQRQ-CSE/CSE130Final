val x = Array("a", "b", "c")
val y = Array("1", "2", "3")

def f(a: Array[String], b:Array[String]){
  val a = Array("100", "200")
  b(0) = "45"
}
val tmp = f(x, y)
val ans = (x, y)

val a = 10
val b = Array(100)
def f (x: Int) = {
  val b = Array(x)
  (y: Int) => {
    val rv = y - a - b(0)
    b(0) = y
    rv
  }
}

val f1 = f(1000)
val ans = (f1(10000), f1(10000))

def q (n : Int) (g: Int => Int) = {
  val count = Array(n)
  (x: Int) => {
    if(count(0) <= 0) 0 else{
      count(0) -= 1
      g(x)
    }
  }
}
val fac: Int => Int = q(7) {(k: Int) =>
  if (k <= 1) 1 else {k * (fac(k-1))}
}
val ans = (fac(5), fac(5))
