
# SonarQube Install/Uninstall Script (Ubuntu & Amazon Linux)

A **simple bash script** to **install or uninstall SonarQube** on **Ubuntu** and **Amazon Linux**.
This is designed for beginners — you just run the script with the right command, and it works.

---

## Features

* Install SonarQube easily
* Uninstall SonarQube easily
* Works on **Ubuntu** and **Amazon Linux**
* No complicated steps

---

## Prerequisites

* Linux system (Ubuntu or Amazon Linux)
* **sudo privileges**
* Internet connection to download SonarQube

---

## How to Use

### Step 1: Create the script file

Create a file named `sonarqube.sh`:

```bash
nano sonarqube.sh
```

Copy and paste the following **script** inside the file:

```bash
#!/bin/bash

ACTION=$1
OS=$2

SONAR_VERSION="9.9.0.65466"
SONAR_ZIP="sonarqube-${SONAR_VERSION}.zip"
SONAR_URL="https://binaries.sonarsource.com/Distribution/sonarqube/${SONAR_ZIP}"
INSTALL_DIR="/opt/sonarqube"

# -------------------------------
# Ubuntu Installation
# -------------------------------
install_ubuntu() {
    echo "Installing SonarQube on Ubuntu..."

    sudo apt update -y
    sudo apt install -y unzip wget openjdk-17-jdk

    wget $SONAR_URL
    sudo unzip $SONAR_ZIP -d /opt
    sudo mv /opt/sonarqube-* $INSTALL_DIR

    echo "SonarQube installed on Ubuntu"
}

uninstall_ubuntu() {
    echo "Uninstalling SonarQube from Ubuntu..."
    sudo rm -rf $INSTALL_DIR
    sudo rm -f $SONAR_ZIP
    echo "SonarQube removed from Ubuntu"
}

# -------------------------------
# Amazon Linux Installation
# -------------------------------
install_amazon() {
    echo "Installing SonarQube on Amazon Linux..."

    sudo yum install -y unzip wget java-17-amazon-corretto

    wget $SONAR_URL
    sudo unzip $SONAR_ZIP -d /opt
    sudo mv /opt/sonarqube-* $INSTALL_DIR

    echo "SonarQube installed on Amazon Linux"
}

uninstall_amazon() {
    echo "Uninstalling SonarQube from Amazon Linux..."
    sudo rm -rf $INSTALL_DIR
    sudo rm -f $SONAR_ZIP
    echo "SonarQube removed from Amazon Linux"
}

# -------------------------------
# Main Logic
# -------------------------------
case "$ACTION-$OS" in
    install-ubuntu) install_ubuntu ;;
    uninstall-ubuntu) uninstall_ubuntu ;;

    install-amazon-linux) install_amazon ;;
    uninstall-amazon-linux) uninstall_amazon ;;

    *)
        echo "Usage:"
        echo "./sonarqube.sh install ubuntu"
        echo "./sonarqube.sh uninstall ubuntu"
        echo "./sonarqube.sh install amazon-linux"
        echo "./sonarqube.sh uninstall amazon-linux"
        exit 1
        ;;
esac
```

### Step 2: Make the script executable

```bash
chmod +x sonarqube.sh
```

---

### Step 3: Run the script

#### Install SonarQube

```bash
# On Ubuntu
./sonarqube.sh install ubuntu

# On Amazon Linux
./sonarqube.sh install amazon-linux
```

#### Uninstall SonarQube

```bash
# On Ubuntu
./sonarqube.sh uninstall ubuntu

# On Amazon Linux
./sonarqube.sh uninstall amazon-linux
```

---

## How it Works (Beginner Explanation)

1. **You give two arguments** to the script:

   * Action → `install` or `uninstall`
   * OS → `ubuntu` or `amazon-linux`

2. **Script checks the OS** and runs the right commands:

   * Installs Java and required utilities (`wget`, `unzip`)
   * Downloads SonarQube zip file from the official website
   * Extracts it to `/opt/sonarqube`

3. **Uninstall just deletes** the `/opt/sonarqube` folder and the downloaded zip file

---

## Notes

* Use `sudo` because the script needs root permissions
* Default installation path is `/opt/sonarqube`
* Change `SONAR_VERSION` in the script if you want a different version

---

## Example Commands (Copy & Run)

```bash
# Install on Ubuntu
./sonarqube.sh install ubuntu

# Uninstall on Ubuntu
./sonarqube.sh uninstall ubuntu

# Install on Amazon Linux
./sonarqube.sh install amazon-linux

# Uninstall on Amazon Linux
./sonarqube.sh uninstall amazon-linux
```

---

