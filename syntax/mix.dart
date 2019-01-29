import "dart:mirrors";

abstract class Flyable {
  void fly();
}
class AirPlane implements Flyable {
  void fly() => print("坐飞机飞走了...");
}
class Spaceship implements Flyable {
  void fly() => print("坐飞船去太空了...");
}


class Animal {
  void eat() => print("Animal eat");
  void sleep() => print("Animal sleep");
}
abstract class Weapon {
  void shoot();
  Weapon.make() {}
}
class Gun implements Weapon {
  void shoot() => print("枪发射了...");
}
class SuperMan<T> {
  void desc() {
    // print("我是超人${T().runtimeType}");
    // T.make().shoot();
    Activator.createInstance(T);
    print(T.runtimeType);
  }
}

class People extends Animal with AirPlane, Spaceship, SuperMan<Gun> {
  @override
  void eat() {
    print("People eat");
  }
  @override
  void sleep() {
    print("People sleep");
  }
  People.itman() {
    
  }
}

void main() {
  // var tom = People.itman();
  // tom.eat();
  // tom.sleep();
  // tom.fly();
  // tom.desc();
  var superMain = SuperMan<String>();
  print(superMain.runtimeType);
  superMain.desc();
}