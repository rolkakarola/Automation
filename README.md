# Nokia Wikipedia Search Automation

## Description
This project demonstrates an automated test using Robot Framework and SeleniumLibrary to perform a series of actions in the Firefox browser.

It opens a Nokia wikipedia page by searching the term in google. The code also takes a screenshot of the website and verifies the founding year of the company.

## Environment Setup

To run the test, ensure your environment meets the following requirements:

- **Python:** 3.11
- **Robot Framework:** 6.0.1
- **SeleniumLibrary:** 6.1.0
- **Firefox Browser:** Latest stable version
- **Geckodriver:** Compatible with the installed Firefox version

### Prerequisites

1. **Python 3.11**: Ensure Python 3.11 is installed on your system. If not, download and install it from the [official Python website](https://www.python.org/downloads/).

2. **Robot Framework**: Install Robot Framework using pip:
   ```bash
   pip install robotframework==6.0.1
   pip install robotframework-seleniumlibrary==6.1.0

3. **Firefox Browser**: Download and install the latest version of Firefox from [here](https://www.mozilla.org/en-US/firefox/new).

4. **Geckodriver**: Download the compatible Geckodriver for your Firefox version from [here](https://github.com/mozilla/geckodriver/releases), and ensure it's available in your system's PATH.
## Installation

### Running the script

#### Steps to execute

1. Clone the repository to your local machine
    ```bash
    git clone https://github.com/yourusername/yourproject.git
    cd yourproject

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
    yourproject/
    │
    ├── TC1.robot            # The main Robot Framework script
    ├── requirements.txt     # Python dependencies
    ├── README.md            # This README file
    └── Results/             # Directory for storing test results (logs, screenshots)

### XPath Locators Used
- Google Search Input Field: name=q
- Wikipedia Link in Results: //a[contains(@href, 'wikipedia.org')]
- Nokia Founding Year on Wikipedia Page: //table[contains(@class, 'infobox')]//th[contains(text(), 'Założona')]/following-sibling::td[1]
- Screenshot Filename: screenshot.png
- Google Search Button: (If needed) name=btnK
- Accept Cookies Button: id=L2AGLb

This README provides all the necessary information to understand, set up, and run the project successfully. Adjust the placeholders like repository URLs, usernames, and contact information according to your specific project details.






