import lodash from "lodash";
import inquirer from "inquirer";

/**
 * Question 1
 * Create an insertion sorting algorithm in ascending order that uses lodash
 */

function insertionSortAsc(unsortedArray) {
  // Make a copy of the unsorted array using lodash to not modify the original array
  const sortedArray = lodash.cloneDeep(unsortedArray);

  // Use lodash's insertion sort algorithm to sort the array in ascending order
  lodash.sortBy(sortedArray);

  return sortedArray;
}

/**
 * Question 2
 * Create an insertion sorting algorithm in descending order that uses lodash
 */
function insertionSortDesc(unsortedArray) {
  // Make a copy of the unsorted array using lodash to not modify the original array
  const sortedArray = lodash.cloneDeep(unsortedArray);

  // Use lodash's insertion sort algorithm and reverse the order to sort the array in descending order
  lodash.reverse(lodash.sortBy(sortedArray));

  return sortedArray;
}

/**
 * Question 3
 * Create a interview questionnaire for backend web develop job using inquirer.js.
 * Be sure to include these *types* of questions
 * Open ended question.
 * A numbered question.
 * A true/false question
 * A checkbox question
 * A multiple choice question.
 * Then finally, display all the questions and answers in the pretty format 
 * */

function createQuestionnaire() {
  // Use inquirer to prompt the user with different types of questions
  inquirer
    .prompt([
      {
        type: "input",
        name: "openEnded",
        message: "What is your experience with backend web development?",
      },
      {
        type: "number",
        name: "numbered",
        message: "What is your preferred programming language?",
      },
      {
        type: "confirm",
        name: "trueFalse",
        message: "Do you have experience with REST APIs?",
        default: false,
      },
      {
        type: "checkbox",
        name: "checkbox",
        message: "What databases have you worked with?",
        choices: ["MySQL", "PostgreSQL", "MongoDB", "Oracle", "SQLite"],
      },
      {
        type: "list",
        name: "multipleChoice",
        message: "What is your preferred web server?",
        choices: ["Apache", "Nginx", "IIS", "Lighttpd", "Caddy"],
      },
    ])
    .then((answers) => {
      // Log all the answers in a pretty format
      console.log("Interview Questionnaire Results:\n");
      console.log(`1. Open Ended: ${answers.openEnded}`);
      console.log(`2. Numbered: ${answers.numbered}`);
      console.log(`3. True/False: ${answers.trueFalse}`);
      console.log(`4. Checkbox: ${answers.checkbox.join(", ")}`);
      console.log(`5. Multiple Choice: ${answers.multipleChoice}`);
    })
    .catch((error) => console.log(error));
}
