# Nokia Wikipedia Search Automation

## Description
This project demonstrates an automated test using [Robot Framework](https://robotframework.org/?tab=libraries#resources) and [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#library-documentation-top) to perform a series of actions in the Firefox browser.

The Python scipt uses a Selenium library for a web testing. It opens a [Google](https://www.google.com) search bar and searches for the term "nokia wikipedia." After the results are loaded, it clicks the first existing link and verifies it. The script also checks if the page title contains "Nokia" and captures a screenshot of the entire page. Additionally, the script verifies the founding year.

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
   ```
   The command above specifies the directory where the test results will be stored. You can change the name 'results' to your own directory name.

##  Project Structure

#### Results

After running the script you will end up with results folder that contains five output files which provides different types of information about your test execution:

    Automation/
    │
    ├── TC1.robot            # The main Robot Framework script
    ├── requirements.txt     # Python dependencies
    ├── README.md            
    └── results/             # Directory with results 
        │
        ├── geckodriver-1.log    # Information about browser operations, HTTP requests and responses       
        ├── output.xml           # Raw test output in XML format
        ├── screenshot.png       
        ├── report.html          # Summary of the test execution and overall test results      
        └── log.html             # Detailed information about each step of the test execution
        
   Both of the html files need to opened in a web browser to see the results.

#### Script Explanation
- ***Browser Type***: The script is configured to use Firefox.
- ***Global Timeout***: All Selenium operations have a global timeout of 30 seconds.
- ***Variables***: The script uses variables for browser type, URL, search term, expected founding year, XPath locators, and screenshot filename.
- ***Error Handling***: The script includes error handling to manage cases where the Wikipedia link is not found.
- ***Teardown***: The script ensures the browser is closed after the test, even if an error occurs.







