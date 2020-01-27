# Web scraper robot

When run, the robot will:

- open a real web browser
- collect the latest tweets by given Twitter user
- create a file system folder by the name of the Twitter user
- store the text content of each tweet in separate files in the folder
- store a screenshot of each tweet in the folder

## Pre-requisites

- Python 3 (https://www.python.org/)
- Robot Framework (https://robotframework.org/)
- SeleniumLibrary (https://robotframework.org/SeleniumLibrary/)
- Chrome (https://www.google.com/chrome/)
- chromedriver (https://chromedriver.chromium.org/downloads)

## Usage

Clone this repository.

In your terminal, navigate to repository root.

Defaults to Robot Frameworks's (`robotframework`) latest three tweets:

```
robot web-scraper-robot.robot
```

### Overriding the user name

```
robot --variable USER_NAME:Madonna web-scraper-robot.robot
```

### Overriding the number of tweets

```
robot --variable NUMBER_OF_TWEETS:5 web-scraper-robot.robot
```
