//* call - s'éxécute instantanément, 1er argument - this, 2ème argument - liste d'items

const john = {
  name: 'john',
  age: 24,
  greet(city, country) {
    console.log(this);
    console.log(
      `Bonjour, je suis ${this.name}, j'ai ${this.age} ans. et j'habite à ${city}, ${country}`
    );
  }
};

john.greet('Lille', 'France');

const susan = {
  name: 'susan',
  age: 21
};

//! errur car la méthode greet() est dans l'objet john
// susan.greet();

john.greet.call(susan, 'Valenciennes', 'France');
john.greet.call({ name: 'peter', age: 30 }, 'La Valette', 'Malte');
