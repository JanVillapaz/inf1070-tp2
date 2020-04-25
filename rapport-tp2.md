
# Rapport du travail pratique 2

-   Ce fichier est un modèle pour vous guider dans la rédaction du rapport. La première section (et le début de la section 2) vous montrent des exemples (à compléter). Dans la cinquième section, vous trouverez un exemple de comment insérer une image dans ce fichier Markdown.
-   Assurez-vous de metre **toutes** les informations demandées dans l'énoncé.
-   Donner les extraits de tous les fichiers de configuration modifiés, créer des liens vers les fichiers créés ou pertinents, afficher les captures d'écran... dans les sections appropriées.
-   Supprimer tous les commentaires de votre rapport, avant de le remettre.
-   Votre rapport doit respecter le format Markdown, et doit être bien formé. Il doit être clair et agréable à lire une fois traduit en HTML. Vous pouvez utiliser des applications Markdown comme `Typora` ou `Formiko`, par exemple, pour rédiger votre rapport plus facilement.
-   Une pénalité être attribuée à un rapport mal formé et difficile à lire.

## [](#identification-du-groupe)Identification du groupe

-   Cours : Utilisation et administration des systèmes informatiques
-   Sigle : INF1070
-   Session : Hiver 2020
-   Groupe : `11`
-   Enseignant : `Johnny Tsheke Shele`
-   Auteur : `Jan Eunice Villapaz` (`VILJ30579403`) (`villapaz.jan_eunice@courrier.uqam.ca`)
-   Auteur : `Maude St-Marseille` (`STMM20549509`) (`st-marseille.maude@courrier.uqam.ca`)

## [](#1-identification-du-syst%C3%A8me-dexploitation)1. Identification du système d'exploitation

### [](#11-syst%C3%A8me-dexploitation)1.1 Système d'exploitation

```
$ lsb_release  -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.4 LTS
Release:	18.04
Codename:	bionic
```

- La commande précédente nous fournit plus précisément les informations suivantes :

Avec la commande suivante :

```
$ sudo apt list --installed > paquetsInit.txt
```

- Nous avons trouvé que notre machine contient paquets .

```
$ tail -n +2 paquetsInit.txt | wc -l
134
```

### [](#12-liste-des-paquets-install%C3%A9s)1.2 Liste des paquets installés

Voir le fichier [paquetsInit.txt](/inf1070/20201-tp2/-/blob/master/paquetsInit.txt).

### [](#12-probl%C3%A8mes-rencontr%C3%A9s)1.2 Problèmes rencontrés

- Le message d'erreur suivant apparaît après avoir entré la commande:
```
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```

## [](#2-python-installation-et-configuration)2. Python - Installation et configuration

### [](#21-installation-et-configuration)2.1 Installation et configuration

- Nous avons commencé par vérifier si `python3` était déjà installé.

```
$ python3 --version
Python 3.6.9
```

- Nous avons ensuite vérifié si `pip3` était déjà installé.

```
$ pip3 --version
bash: pip3 : commande introuvable 
```

- Nous avons installé (ou mis à jour) `python` avec la commande ci-après.

```
$ sudo apt list --installed | grep 'python' | wc -l
```

- On revérifié si `pip3` est maintenant installé:

```
$ pip3 --version
pip 9.0.1 from /usr/lib/python3/dist-packages (python 3.6)
```

### [](#22-liste-des-paquets-install%C3%A9s)2.2 Liste des paquets installés

- Pour produire la liste des paquets installés à ce stade, on entre la commande :

```
$ apt list --installed > paquetsPython.txt
```

Voir le fichier [paquetsPython.txt](/inf1070/20201-tp2/-/blob/master/paquetsPython.txt).


### [](#23-probl%C3%A8mes-rencontr%C3%A9s)2.3 Problèmes rencontrés

Le message d'erreur suivant apparaît après avoir entré la commande:
```
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```

## [](#3-postgresql-installation-et-configuration)3. PostgreSQL - Installation et configuration

### [](#31-installation-du-sgbd-et-d%C3%A9marrage-du-serveur)3.1 Installation du SGBD, et démarrage du serveur

- La commande pour installer le SGBD:
```
$ sudo apt install postgresql postgresql-client
```
- Un utilisateur système `postgres` devrait être créé si tout se bien passé.
- Vérifiez qu'on a bien un utilisateur `postgres`

```
$ id postgres
uid=102(postgres) gid=103(postres) groupes=103(postgres),102(ssl-cert)
```

- Démarer le serveur postgresql :

```
$ sudo service postgresql start
``` 

### [](#32-base-de-donn%C3%A9es-utilisateur-bd-mot-de-passe)3.2 Base de données : utilisateur, BD, mot de passe...

-   Créer un utilisateur `odoo` pour la base de données

```
$ sudo -u postgres createuser -s odoo
```

-   Créer une base de données `odoo`, et en donner la propriété à l'utilisateur `odoo` :

```
$ sudo -u postgres createdb -E utf8 -l fr_CA.utf8 -T template0 -O odoo odoo
```

-   Modifier le mot de passe de l'utilisateur `odoo` par `passodoo` :

```
$ sudo -u postgres psql --command="ALTER USER odoo WITH PASSWORD 'passodoo'"
```

### [](#33-liste-des-paquets-install%C3%A9s)3.3 Liste des paquets installés

-   Produire la liste des paquets installés à ce stade, et dire combien il y en a au total, maintenant.

```
$ sudo apt list --installed > paquetsPostgreSql.txt
```

### [](#34-probl%C3%A8mes-rencontr%C3%A9s)3.4 Problèmes rencontrés



## [](#4-odoo-installation-et-configuration)4. Odoo - Installation et configuration

### 4.1 Installation
-   Prérequis - installer les requis suivants :

```
$ sudo apt install python3-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev 
```

-   Installer `nodejs` et `npm` et `wkhtmltopdf` :

```
$ sudo apt install wkhtmltopdf nodejs npm 
```

-   Installer `rtlcss` avec le gestionnaire des paquets `npm` pour la prise en charge des langues de droite à gauche :

```
$ sudo npm install -g rtlcss
```

-   Copier le code source odoo, et le mettre dans le dossier d'installation :

```
$ sudo cp -r /inf1070/odoo /opt/
```

-   Installer des librairies python spécifiques (peut nécessiter une connexion Internet).
    
    -   Allez dans le dossier `odoo` contenant le code source. C'est le dossier qui contient le fichier `requirements.txt`
    -   Tapez les commandes suivantes pour installer les librairies Python :
    
    ```
    $ sudo pip3 install setuptools wheel
    $ sudo pip3 install -r requirements.txt
    $ sudo pip3 install -U pip
    $ sudo pip3 install Pypdf2
    ```

#### [](#411-liste-des-paquets-install%C3%A9s)4.1.1 Liste des paquets installés

-   Produire la liste des paquets installés à ce stade, et dire combien il y en a, au total, maintenant.
    

```
$ apt list --installed > paquetsPrerequis.txt
```

Voir le fichier [paquetsPrerequis.txt](/inf1070/20201-tp2/-/blob/master/paquetsPrerequis.txt).

### 4.2 Configuration et démarrage

-   Création du dossier pour les données.
```
$ sudo mkdir /var/odoo
$ sudo chmod  -R  755 /var/odoo
```

- Extrait de la section du fichier `odoo.conf` modifiée :

```
   **addons_path**: addons
   **data_dir**: /var/odoo
   **database**: odoo
   **db_user**: odoo
   **db_password**: passodoo
```

-   Copiez le fichier `odoo.conf` das le dossier d'installation de odoo.
-   Installez la base de données de odoo en tapant la commande suivante dans le dossier d'instalation de odoo

```
$ sudo python3 odoo-bin --addons-path=addons --data-dir=/var/odoo -d odoo -r odoo -w passodoo \
 -i base --stop-after-init --db_host localhost
```
- Démarrer le serveur odoo :

```
$ sudo python3 odoo-bin --addons-path=addons --data-dir=/var/odoo -d odoo -r odoo -w passodoo \
 --db_host localhost
```
 
#### [](#421-script-shell-de-d%C3%A9marrage-de-odoo)4.2.1 Script shell de démarrage de Odoo

Pour démarrer Odoo, lancez le script suivant [startodoo.sh](/inf1070/20201-tp2/-/blob/master/startodoo.sh).

```
$ sudo python3 odoo-bin --addons-path=addons --data-dir=/var/odoo -d odoo -r odoo -w passodoo \
 --db_host localhost
```

## [](#5-odoo-applications-et-utilisation)5. Odoo - Applications et utilisation

- Avec un fureteur (Chrome), Allez sur le site ([http://localhost:8065/](http://localhost:8065/))

- Connectez à postgres et vérifiez que plusieurs tables sont bien créées dans la base de données `odoo`.

```
$ sudo -u postgres psql
```

-   Pour voir la liste des bases de données (BD)

```
postgres=# \l
```
![Liste BD](databaselist.png) 

- Voir la liste des utilisateurs postgreSQL :

```
postgres=# \du
```
![Liste utilisateurs](userlist.png) 
- Se connecter à la base de données odoo :

```
postgres=# \c odoo
```

- Voir si plusieurs (plus de 2) des tables ont bien été créées :

```
postgres=# \dt
```
![Liste BD](tablelists.png) 

- Pour quitter postgreSQL, tapez la commande suivante :

```
postgres=# \q
```

- Sur l'interface Web, connectez-vous avec le nom d'utilisateur admin, et le mot de
passe admin.


## [](#6-sauvegarde-et-restauration)6. Sauvegarde et restauration

### [](#61-base-de-donn%C3%A9es)6.1 Base de données

Voir le fichier [odoo_bd.bak](/inf1070/20201-tp2/-/blob/master/odoo_bd.bak).

- Après avoir rédigé tous les rapports, et effectué toutes les configurations, effectuez
une sauvegarde (backup) de la base de données.

```
$ sudo -u postgres pg_dump odoo > odoo_bd.bak
```

### [](#62-fichiers-de-donn%C3%A9es-et-de-configuration)6.2 Fichiers de données et de configuration

- En utilisant la commande tar (au au besoin gzip), créez un fichier odoo.tar.gz
- du répertoire des données /var/odoo

Voir le fichier [odoo.tar.gz](/inf1070/20201-tp2/-/blob/master/odoo.tar.gz).

Voir le fichier [odoo.conf](/inf1070/20201-tp2/-/blob/master/odoo.conf).
