# Team 624 Scouting System

The Team 624 Scouting System consists of two software applications: a desktop app and a mobile app. The mobile app allows scouts to input relevant data, which is then converted into a scannable QR code. The desktop app scans the QR code and archives the data for future reference. Setting up both apps properly is essential to implement this system successfully.

## Mobile App 

The Scouting App provides a user-friendly interface with intuitive widgets like counters, toggle buttons, and text boxes. It also includes a visual representation of the grid used in the game. To track game pieces accurately, simply enter the locations where cones and cubes are placed on the grid. The app makes data collection and analysis during competitions more efficient and precise.

### Database 

The app utilizes the Performance class to store data about each team's performance in a given match. The Performance class contains various variables that are connected to specific widgets, allowing users to modify their values. Once the data entry is complete, the data is compressed into a single string. The app displays a QR code containing that string and also stores it for future reference.

The compression process involves converting the data into a shorter string using base conversion techniques. Each node on the grid has a limited number of options for occupation, denoted by X. These options are assigned numbers from 0 to X-1. The numbers for each node are then combined into a 9-digit number in base X. Further conversion of this number to base 32 reduces its length, ensuring that the QR code can accommodate all variables while being shorter. In the desktop app, the number can be converted back from base 32 to base X and stored in the database. This logical approach is used to store data about each row for both the autonomous and teleop periods of the match.

The system uses the Entry class to store data entries in the database. Each Entry instance includes the match number, team number, and the compressed string from the Performance class. When users commit data to the database, an Entry object is created based on the Performance object and stored locally. 

### Additional setup

The tablet used by the team during competitions operates without an internet connection, making it impossible to rely on external data sources such as The Blue Alliance. Instead, the team list is stored in teams.dart and serves the purpose of validating the accuracy of team numbers before displaying the QR code. This team list can be modified prior to each competition to accommodate any changes in participating teams.

### Other

The app also keeps track of the match number, which is automatically incremented, and the scout's initials, which are carried over from match to match. All data is stored in the local database, and users can access it by pressing the logo in the top left on the last page of the app. From there, they can select data entries, combine them into QR codes, or delete them.

Note: Fumbles refer to attempts to place a piece on the mid/high level that resulted in the piece dropping either on the hybrid nodes or outside the grid.
