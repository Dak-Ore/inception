# 🐳 Inception - Projet Docker (42)

Inception est un projet de l'école 42 visant à découvrir Docker et la gestion de conteneurs. Le but est de mettre en place un environnement WordPress complet, auto-hébergé, sécurisé avec SSL, et extensible grâce à divers services additionnels.

---

## 🧱 Services inclus

### 🛠️ Principaux
- **Nginx** : serveur web reverse proxy avec SSL (port 443)
- **MariaDB** : base de données pour WordPress
- **WordPress** : CMS accessible via Nginx

### ✨ Bonus
- **Static site** : serveur HTTP statique (port 3000)
- **Redis cache** : gestion du cache pour wordpress
- **Adminer** : interface web de gestion MySQL
- **FTP** : accès FTP aux fichiers WordPress
- **Ngrok** : tunnel public vers le site statique

---

## 📦 Structure

Le projet utilise un `docker-compose.yml` pour orchestrer tous les services et des volumes locaux pour persister les données :

- `wordpress_data` : fichiers WordPress
- `wordpress_db` : base de données MariaDB
- `adminer_data` : fichiers d'Adminer

Les données sont montées depuis `home/rsebasti/data/` grâce à des volumes avec `bind`.

---

## 🚀 Lancement

```docker-compose up --build```

## 🌐 Accès aux services

- 🔒 **WordPress** : https://rsebasti.42.fr
- 🛠️ **Adminer** : https://rebasti.42.fr/adminer  
- 📝 **Static site** : http://localhost:3000
- 📁 **FTP** : rsebasti.42.fr
- 🌍 **Ngrok** : lien généré affiché dans les logs du conteneur `ngrok`

## 🏁 Objectif pédagogique

Ce projet m'a permis de :
- Comprendre la logique d'orchestration avec Docker Compose
- Créer des images Docker personnalisées à partir de `Dockerfile`
- Mettre en place un environnement multi-conteneurs isolé et cohérent
- Utiliser des volumes pour la persistance des données
- Gérer les variables d'environnement avec un fichier `.env`
- Ajouter des services bonus comme Redis, FTP, Adminer ou Ngrok
- Approfondir ma compréhension de la sécurité (certificats SSL avec Nginx)

