// Insertion sort function to sort an array in ascending order
function insertionSort(arr) {
  for (let i = 1; i < arr.length; i++) {
    let currentVal = arr[i];
    let j = i - 1;
    // Shift elements greater than currentVal to the right
    while (j >= 0 && arr[j] > currentVal) {
      arr[j + 1] = arr[j];
      j--;
    }
    // Insert currentVal in its correct position
    arr[j + 1] = currentVal;
  }
  return arr;
}

// Function to read a list and perform certain actions on its elements
function listActions(list) {
  let size = list.length;
  for (let i = 0; i < size; i++) {
    // Print each element
    console.log(list[i]);
    // If element is 13, print "Unlucky" and exit loop
    if (list[i] === 13) {
      console.log("Unlucky");
      break;
    }
    // If element is prime, add 4 to the end of the list
    if (isPrime(list[i])) {
      list.push(4);
      size++;
    }
    // If element is odd, skip the next adjacent element
    if (list[i] % 2 !== 0) {
      i++;
    }
  }
  console.log(list);
}

// Function to reverse a list
function reverseList(list, size) {
  // Loop through the list in reverse and print each element
  for (let i = size - 1; i >= 0; i--) {
    console.log(list[i]);
  }
}

// Function to check if a number is prime
function isPrime(n) {
  // A number less than or equal to 1 is not prime
  if (n <= 1) {
    return false;
  }
  // Check for factors up to the square root of n
  for (let i = 2; i <= Math.sqrt(n); i++) {
    if (n % i === 0) {
      // If n has a factor other than 1 and itself, it is not prime
      return false;
    }
  }
  // If no factors are found, n is prime
  return true;
}

// Function to find the next prime number after a given number
function nextPrime(n) {
  let next = n + 1;
  while (!isPrime(next)) {
    next++;
  }
  return next;
}

// Function to find the previous prime number before a given number
function prevPrime(n) {
  let prev = n - 1;
  while (!isPrime(prev)) {
    prev--;
  }
  return prev;
}

// Function to detect if a number is prime or not and return the next highest and previous lower prime numbers
function primeNumberDetector(n) {
  if (isPrime(n)) {
    console.log(n + " is a prime number.");
  } else {
    console.log(n + " is not a prime number.");
    let next = nextPrime(n);
    let prev = prevPrime(n);
    console.log("The next highest prime number is " + next);
    console.log("The previous lower prime number is " + prev);
  }
}
