# Mechanical Keyboard Builder

Mechanical Keyboard Builder is a web application designed to help enthusiasts configure, manage, and bookmark their custom keyboard builds. The application features a user-friendly interface for selecting keyboard sizes, managing price inputs, and saving user preferences with database integration.

## Table of Contents
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Database Schema](#database-schema)
- [Known Issues](#known-issues)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)

## Features
- **User Authentication**: Register and log in securely.
- **Keyboard Size Selection**: Dropdown menu for various keyboard configurations (60%, 75%, 100%, etc.).
- **Price Input**: Price fields formatted to two decimal places.
- **Bookmarking**: Save and manage bookmarks for different builds.
- **Session Management**: Maintain active user sessions while keeping database connections secure.
- **Sign Out**: Securely sign out users, clearing only user-specific session attributes.

## Technology Stack
- **Backend**: Java (Servlets, JSP)
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MySQL
- **Web Server**: Apache Tomcat
- **Tools**: Git, Maven

## Setup and Installation
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/mechanical-keyboard-builder.git
   cd mechanical-keyboard-builder
### Setting Up Apache Tomcat
1. **Download Apache Tomcat**:
   - Go to the [Apache Tomcat website](https://tomcat.apache.org/) and download the latest version compatible with your setup.
   
2. **Install and Configure**:
   - Extract the downloaded archive to a suitable location on your system.
   - Set the `CATALINA_HOME` environment variable to the path of your Tomcat installation.
   
3. **Configure Tomcat for Your Project**:
   - Navigate to the `conf` directory in your Tomcat installation.
   - Open `server.xml` and ensure the following:
     - The port is set correctly (default is 8080).
     - `<Context>` configuration (if needed) can be added under `<Host>`.
   - Place your `.war` file in the `webapps` directory.

4. **Starting Tomcat**:
   - Use the following command in your terminal:
     ```bash
     <CATALINA_HOME>/bin/startup.sh   # For Unix/Linux
     <CATALINA_HOME>\bin\startup.bat  # For Windows
     ```
   - Access your application at `http://localhost:8080/Mechanical_Keyboard_Builder`.

5. **Stopping Tomcat**:
   - Use the following command:
     ```bash
     <CATALINA_HOME>/bin/shutdown.sh   # For Unix/Linux
     <CATALINA_HOME>\bin\shutdown.bat  # For Windows
     ```

### Setting Up MySQL Workbench
1. **Download MySQL Workbench**:
   - Visit the [MySQL website](https://dev.mysql.com/downloads/workbench/) and download MySQL Workbench for your operating system.

2. **Install MySQL Server**:
   - If you haven't already installed MySQL Server, download it from the [MySQL website](https://dev.mysql.com/downloads/mysql/).
   - Follow the installation wizard to set up the server, including setting a root password.

3. **Configure MySQL Workbench**:
   - Open MySQL Workbench and create a new connection.
   - Enter the following details:
     - **Connection Name**: Any name of your choice.
     - **Hostname**: `localhost`
     - **Port**: `3306` (default)
     - **Username**: `root` (or another user with the necessary privileges)
     - **Password**: Click "Store in Vault" to save your password.
   - Test the connection to ensure everything is working correctly.

4. **Setting Up the Database**:
   - Use the `schema.sql` file provided in the `sql` folder to create the necessary tables.
   - Open the script in MySQL Workbench and execute it to initialize the database.

5. **Grant Permissions** (if necessary):
   - Run the following SQL command to grant privileges to your user:
     ```sql
     GRANT ALL PRIVILEGES ON mkdb.* TO 'yourUser'@'localhost' IDENTIFIED BY 'yourPassword';
     FLUSH PRIVILEGES;
     ```

### Connecting Your Application to MySQL
- Ensure that your `config.properties` file includes the correct database URL, username, and password.
- The format should look like this:
  ```properties
  db.url=jdbc:mysql://localhost:3306/mkdb?useSSL=false
  db.user=yourUser
  db.password=yourPassword
