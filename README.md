This project uses a Bash script to automate basic security log analysis.
The script accepts a log file as an argument, searches it for failed and denied events,
saves matching entries to an output file, and reports the number of suspicious events found.

HOW IT WORKS
The script uses the first command-line argument ($1) as the log file to analyze. This allows the same
script to analyze different log files without changing the script itself.

It als checks whether a filenmae was provided and whether that file actually exists before beginning
the analysis.

LOG ANALYSIS
The script searches the selected log file for events containing the words failed or denied. The search
is case-insensitive so variations in captialization are still detected.

Matching events are saved to failed-auth.trxt. The script then counts the  number of matching lines
displays the total to the user.

USAGE
Run the script by providing the log file you want to analyze:

bash analyze-log.sh <logfile>

For example:

bash analyze-log.sh auth.log

Example output: 

Suspicious events found: 4
Results saved to: failed-auth.txt

SKILLS DEMONSTRATED

* Bash scripting and automation
* Command-line arguments and variables
* Conditional statements and file validation
* Searching log data with grep
* Input/Output redirection using > and >>
* Counting results with wc
* Basic security log analysis
* Git and GitHub version control
