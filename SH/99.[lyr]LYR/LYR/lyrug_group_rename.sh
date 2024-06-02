#!/bin/bash
# -------------------------------------------------------------------
# lyrug_group_rename.sh
# -------------------------------------------------------------------

#:begin
echo '------------------------------------------------'
echo ' Изменить имя группы с помощью команды groupmod '
echo '------------------------------------------------'
# Изменить имя группы с помощью команды groupmod
sudo groupmod -n DATA_public_w DATA-public-w
sudo groupmod -n DATA_public_r DATA-public-r

# Изменить имя группы с помощью команды groupmod
sudo groupmod -n DATA_lyrs_w DATA-lyrs-w
sudo groupmod -n DATA_lyrs_r DATA-lyrs-r

# Изменить имя группы с помощью команды groupmod
sudo groupmod -n DATA_lyr_w DATA-lyr-w
sudo groupmod -n DATA_lyr_r DATA-lyr-r

#:Exit

