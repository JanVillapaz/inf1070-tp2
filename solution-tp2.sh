#!/bin/sh
# TP2 Hiver 2020 
# Jan Eunice Villapaz (VILJ30579403) (VILLAPAZ.JAN_EUNICE@COURRIER.UQAM.CA)
# Maude St-Marseille (STMM20549509)(ST-MARSEILLE.MAUDE@CCOURRIER.UQAM.CA)


# 1. Identification Os
# lsb_release  -a
# sudo apt list --installed > paquetsInit.txt
# tail -n +1 paquetsInit.txt | wc -l

# 2. Python
# python3 --version
# pip3 --version
# sudo apt install python3 python3-pip
# python3 --version
# pip3 --version
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 10
# apt list --installed > paquetsPython.txt

# 3. PostgreSql
# sudo apt install postgresql postgresql-client
# id postgres
# sudo service  postgresql start
# sudo -u postgres createuser -s odoo
# sudo -u postgres createdb -E utf8 -l fr_CA.utf8 -T template0 -O odoo odoo
# sudo -u postgres psql --command="ALTER USER odoo WITH PASSWORD 'passodoo'"
# sudo apt list --installed > paquetsPostgreSql.txt

# 4. Odoo
# sudo apt install python3-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev 
# sudo apt install wkhtmltopdf nodejs npm 
# sudo npm install -g rtlcss
# sudo cp -r /inf1070/odoo /opt/
# 
# sudo pip3 install setuptools wheel
# sudo pip3 install -r requirements.txt
# sudo pip3 install -U pip
# sudo pip3 install Pypdf2
# apt list --installed > paquetsPrerequis.txt
# sudo mkdir /var/odoo
# sudo chmod  -R  755 /var/odoo
# sudo cp -r /inf1070/odoo.conf /opt/odoo/
# $ chmod 755 /opt/odoo
# vim startodoo.sh
# chmod 755 startodoo.sh 
# sudo -u postgres psql
# postgres=# \l
# postgres=# \du
# postgres=# \c odoo
# postgres=# \dt
# postgres=# \q

# 5. Backup et restauration
# sudo -u postgres pg_dump odoo > odoo_bd.bak
