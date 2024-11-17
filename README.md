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
