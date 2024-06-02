#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_python312_u2310.sh
# -------------------------------------------------------------------

#:begin
    # --------------------------------------------
    # Установка python 3.12 ubuntu 23.10
    # --------------------------------------------
    # python --version
    python3 --version

    # Step 1: Update Ubuntu Before Python 3.12 Installation
    # To update your system, execute the following command in your terminal:
    sudo apt update
    # Next, upgrade any outdated packages on your system with the command:
    sudo apt upgrade

    # Step 2: Import Python 3.12 PPA on Ubuntu
    # Run the following command to import the stable PPA for Python 3.12:
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    # If you want the latest upstream version of Python 3.12, which is still under active development, import the Python Nightly PPA from the same team. We only recommend this step if you seek the most recent updates:
    sudo add-apt-repository ppa:deadsnakes/nightly -y

    # Step 3: Refresh the APT Cache After Python 3.12 PPA Import
    # After importing the PPA, it’s necessary to update the APT index to reflect the newly added repository. You can do this by running the following command:
    sudo apt update

    # Step 4: Install Python 3.12 on Ubuntu via APT Command
    # With the Python 3.12 PPA now part of your system’s repositories, you can proceed with the installation of Python 3.12. Execute the following command to install Python:
    sudo apt install python3.12 -y
    
    # To confirm the successful installation and check the build version of Python, use the command:
    python3.12 --version

    # Optionally, you can install additional modules for Python 3.12. The following command includes a broad range of modules, but you can remove any that you don’t require:
    sudo apt install python3.12-{tk,dev,dbg,venv,gdbm,distutils}

    # If you’re looking for a specific module not listed above, you can search for it in your terminal using the apt search command, which will list all the available packages for Python 3.12:
    apt search python3.12-*

    # For a comprehensive installation, you can install all extras with the command:
    sudo apt install python3.12-full

    # Finally, if you need to install multiple versions of Python alongside Python 3.12, you can do so using the following command:
    sudo apt install python{2.7,3.7,3.8,3.9,3.10,3.11,3.12}

    # Switch Default Python Versions with Python on Ubuntu 22.04 or 20.04
    # As a user of several Python versions, it’s beneficial to understand how to switch your default Python version to suit different tasks or requirements. Adjusting symbolic links and selecting your preferred version can easily manage this process.

    # Step 1: Create Symbolic Links for Each Python Version on Ubuntu
    # To start, generate symbolic links for each Python version individually. Assign a group name (in this case, ‘python’) and an associated option number to each version.

    # For instance, you might use the following commands:
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 2
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 3
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 4
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 5
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 6
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.12 7

    # Step 2: List Available Python Versions on Ubuntu
    # Once you’ve established your symbolic links, the next step involves listing the Python versions to verify their installation and observing the default version.

    # You can achieve this by running the following command:
    sudo update-alternatives --config python

    # Step 3: Change Python 3.12 Version to Alternative with Ubuntu
    # To change the default Python version, input the selection number of your desired version. For example, to set Python 3.11 as your default, enter ‘2’ (based on the example commands mentioned earlier). Remember, the option numbers for versions on your system might vary, so always refer to the list provided.

    # Once you complete this, the message displayed will be:
    update-alternatives: using /usr/bin/python3.11 to provide /usr/bin/python (python) in manual mode

    # python --version
    python3 --version

#:Exit
