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

    # Откройте приглашение терминала и добавьте следующий PPA.
    sudo add-apt-repository ppa:deadsnakes/ppa

    # Обновите кеш, используя команду ниже.
    sudo apt update

    # И установите Python 3.12, используя команду ниже.
    sudo apt install python3.12

    # Установить версии Python по умолчанию
    # Теоретически в дистрибутивах Linux можно установить несколько версий Python, но по умолчанию может быть только одна версия. Настройка Python 3.12 по умолчанию требует некоторых дополнительных шагов.
    # Следуйте дальше.
    # Однако прежде чем сделать это, убедитесь, что вы знаете, какие приложения зависят от Python 3.11 или 3.10 (для версии Ubuntu LTS). Вы можете легко узнать это, используя команду apt-cache rdependents, как показано ниже.
    apt-cache rdepends python3.12
    apt-cache rdepends python3.11
    apt-cache rdepends python3.10

    # Сначала проверьте текущую версию Python по умолчанию, используя приведенную ниже команду из терминала.
    python3 --version

    # Используйте update-alternatives для создания символических ссылок на python3
    #sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 2

    # И выберите, какой из них использовать в качестве Python3, с помощью команды:
    #sudo update-alternatives --config python3

#:Exit
