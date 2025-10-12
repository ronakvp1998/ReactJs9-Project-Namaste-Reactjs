//  Exercise 1

// console.log(this);
// // window

// const obj = {
//   fn: function () {
//     console.log(this);
//     // fn object
//   },

//   fn2: () => {
//     console.log(this);
//     // window object
//   },
// };

// obj.fn();
// obj.fn2();

// *****************************************
//  Exercise 2

// function x() {
//   console.log(this);
//   // window
//   function y() {
//     console.log(this);
//     // window
//     function z() {
//       console.log(this);
//       // window
//     }
//     z();
//   }
//   y();
// }
// x();

// *****************************************
//  Exercise 3

// const person = {
//   name: "Akshay",
// };

// const person2 = {
//   name: "Simran",
// };

// function x() {
//   console.log(this);
// }

// x.call(this);
// // window
// x.call(person);
// // name: akshay
// x.call(person2);
// // name: Simran
// x(person2);
// // window

// *****************************************
//  Exercise 4

// const person = {
//   name: "Akshay",
//   print: function () {
//     console.log(this);
//   },
// };

// const person2 = {
//   name: "Simran",
// };

// person.print();
// // name: Akshay, print f

// person.print.call();
// // window

// person.print.call(this);
// // window

// person.print.call(person2);
// // name: simran

// *****************************************
//  Exercise 5

// function x() {
//   console.log(this);
//   // window object
// }
// x();

// const obj = {
//   firstname: "Akhsy",
//   printName: () => {
//     console.log(this.firstname);
//     // Undefined
//   },

//   printName2: function () {
//     console.log(this.firstname);
//     // akshay
//   },
// };

// obj.printName();
// obj.printName2();

// obj.printName.call();
// // undefined becasue this is window

// *****************************************
//  Exercise 6

const obj = {
  firstname: "Akhsy",
  printName: () => {
    console.log(this);
    // window
  },

  printName2: function () {
    console.log(this);
    // akshay , .....
  },
};

const obj2 = {
  firstname: "Simran",
};

obj.printName();
obj.printName2();

obj.printName.call();
// window

obj.printName2.call();
// window
