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
