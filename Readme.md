# Karate - API Testing
## Description

Karate is an open-source tool to combine API test-automation, mocks, performance-testing and UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral. Assertions and HTML reports are built-in, and we can run tests in parallel for speed.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [References](#references)

## Installation

### Pre requisite

- Visual Studio Code (VS Code) or Intellij
- Java 1.8 or above
- Maven 3.8.6

### Setup

- src/test/java
- |
- +-- karate-config.js
- +-- logback-test.xml
- |
- \-- product
- |   |
- |   +-- product.feature
- |   +-- product.graphql
- |   \-- TestRunner.java
- |   \-- TestRunnerParallel.java


- Karate-config.js -  this file can be used as global to load all variables. we can use this file to set environment as well.
- logback-test.xml - for logging purpose
- product.feature -this file contains testcases
- product.graphql - this file has query for the api
- TestRunner/ TestRunnerParallel - to execute tests 

#### Maven Argument List

Maven Argument | Description
:--- | :---
`karate.env` | environment


#### Steps

- Clone repository.
- Execute tests using maven `mvn test -Dtest=TestRunner`
- Execute tests in parallel using maven `mvn test -Dtest=TestRunnerParallel`
- we can execute test based on environment as well `mvn test -Dkarate.env=dev -Dtest=TestRunner`

## References

- [Karate framework](https://karatelabs.github.io/karate)

