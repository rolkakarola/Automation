# Nokia Wikipedia Search Automation

## Description
This project demonstrates an automated test using [Robot Framework](https://robotframework.org/?tab=libraries#resources) and [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#library-documentation-top) to perform a series of actions in the Firefox browser.

It opens a Nokia wikipedia page by searching the term in google. The code also takes a screenshot of the website and verifies the founding year of the company.

For more information about Selenium Library click [here](https://github.com/robotframework/SeleniumLibrary/?tab=readme-ov-file).
## Environment Setup

To run the test, your environment should have the following requirements:

- **Python:** 3.11
- **Robot Framework:** 6.0.1
- **SeleniumLibrary:** 6.1.0
- **Firefox Browser:** Latest stable version
- **Geckodriver:** Compatible with the installed Firefox version

### Prerequisites

1. **Python 3.11**: Ensure Python 3.11 is installed on your system. If not, download and install it from the [official Python website](https://www.python.org/downloads/) or use homebrew (Linux/macOS):
   ```bash
   brew install python@3.11

3. **Robot Framework**: Install Robot Framework using pip or pip3 (Linux/macOS):
      ```bash
      pip install robotframework==6.0.1
      pip install robotframework-seleniumlibrary==6.5.0
      pip install selenium==4.10.0
      ```
   Alternatively you can install the required Python packages after cloning the repository (for more look at Installation).
4. **Firefox Browser**: Download and install the latest version of Firefox from [here](https://www.mozilla.org/en-US/firefox/new).

5. **Geckodriver**: Download the compatible Geckodriver Asset for your Firefox version from [here](https://github.com/mozilla/geckodriver/releases), and ensure it's available in your project PATH.
## Installation

### Running the script

#### Steps to execute

1. Clone the repository to your local machine
    ```bash
    cd path/to/your/directory
    git clone https://github.com/rolkakarola/Automation

2. Install the required Python packages:
    ```bash
    pip install -r requirements.txt

3. Run the Robot Framework test script:
   ```bash
   robot -d results TC1.robot

#### Script Explanation
- ***Browser Type***: The script is configured to use Firefox.
- ***Global Timeout***: All Selenium operations have a global timeout of 30 seconds.
- ***Variables***: The script uses variables for browser type, URL, search term, expected founding year, XPath locators, and screenshot filename.
- ***Error Handling***: The script includes error handling to manage cases where the Wikipedia link is not found.
- ***Teardown***: The script ensures the browser is closed after the test, even if an error occurs.

###  Project Structure
    Automation/
    │
    ├── TC1.robot            # The main Robot Framework script
    ├── requirements.txt     # Python dependencies
    ├── README.md            # This README file
    └── results/             # Directory for storing test results (logs, screenshots) that will be created automatically 

### XPath Locators Used
- Google Search Input Field: name=q
- Wikipedia Link in Results: //a[contains(@href, 'wikipedia.org')]
- Nokia Founding Year on Wikipedia Page: //table[contains(@class, 'infobox')]//th[contains(text(), 'Założona')]/following-sibling::td[1]
- Screenshot Filename: screenshot.png
- Google Search Button: name=btnK
- Accept Cookies Button: id=L2AGLb






