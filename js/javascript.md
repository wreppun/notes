# Arrow Function Expressions vs Function Expression

## this

### Arrow Functions
- does not create its own `this`
- uses the `this` of context
- creates issues for methods on objects
```
const withArrow = {
  a: 10,
  b: () => this.a
};

// withArrow.b() -> undefined

const withFunction = {
  a: 20,
  b: function () {
    return withArrow.b();
  },
  c: function () {
    return this.a;
  }
};

// withFunction.b() -> 20
// withFunction.c() -> 20

```

### Class methods in callbacks

Common syntax for creating a class method
```
class Dog {
  constructor (name) {
    this.name = name
  }

  speak () {
    return "My name is " + this.name;
  }

  think () {
    return "Why do they always want to to say " + this.speak();
  }
}
```    

This behaves as expected

```
const d = new Dog('Rufus');
d.speak(); // "My name is Rufus
```

But when you detach the method from the class, it loses its this context.  From MDN:

> When a static or prototype method is called without an object valued "this" (or with "this" as boolean, string, number, undefined or null), then the "this" value will be undefined inside the called function. Autoboxing will not happen. The behaviour will be the same even if we write the code in non-strict mode.

So something like this can happen

```
const d = new Dog('Rufus');
let speak = d.speak;
speak(); // Error!
```

Looks like an edge case, but it happens fairly regularly, when passing class methods as callbacks in react/native:

```
class Updater extends Component {
  constructor () {
    this.state = {
      state.count = 0;
    };
  }

  increment () {
    this.setState({
      increment = this.state.increment + 1
    });
  }

  render () {
    return (
      <TouchableHighlight onPress={this.increment}>
        <Text>Add one!</Text>
      </TouchableHighlight>
    );
  }
}
```

When you click "Add one!", you'll get a `this.state` is undefined error;  passing onPress this.increment detaches this.increment from its context.
