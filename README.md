# Robot Framework


## Project Structure

The project is organized into the following directories:

- `tests`: Contains the test suite files.
- `resources`: Contains resource files with keywords and locators.
  - `keywords.robot`: Defines reusable keywords for test cases.
  - `locators.robot`: Contains locator variables for web elements.
  
## Prerequisites

Before running the tests, ensure you have the following prerequisites installed:

- Python
- Robot Framework
- SeleniumLibrary

You can install Robot Framework and SeleniumLibrary using pip3:

```bash
pip3 install robotframework
pip3 install robotframework-seleniumlibrary
```

## Running the Tests

To run the tests, navigate to the `tests` directory and execute the test suite file using the `robot` command:

```bash
cd tests
robot exercise_tests.robot
```