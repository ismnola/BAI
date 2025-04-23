# Boîte à Idées (BAI)

## Description
Un système de collecte, d’évaluation et de gestion d’idées (Boîte AI Idées). Permet aux utilisateurs de proposer des idées et aux admins de les noter et de changer leur statut.

## Architecture
- **Backend** : Node.js + Express + MySQL
- **Auth** : JWT (`jsonwebtoken`), bcrypt
- **Frontends** : React + Vite + Tailwind CSS (admin & user)
- **Base de données** : MariaDB/MySQL
- **Conteneurisation** : Docker, Docker‑Compose, Nginx
- **CI/CD** : GitLab CI

## Installation

### Prérequis
- Docker & Docker‑Compose (ou Node.js v16+ & npm/yarn)

### Avec Docker
```bash
git clone <repo-url>
cd BAI
docker-compose up --build
```
Accès :
- API : http://localhost:3000
- UI Admin : http://localhost:3001
- UI User : http://localhost:3002

### En local sans Docker

#### Backend
```bash
cd backend
npm install
# config.json: paramètres MySQL
npm start    # http://localhost:3000
```

#### Frontend Admin
```bash
cd frontend-admin
npm install
npm run dev  # port défini dans vite.config.js
```

#### Frontend User
```bash
cd frontend-user
npm install
npm run dev
```

## API Endpoints

### Auth
| Méthode | Route             | Description                |
|---------|-------------------|----------------------------|
| POST    | /auth/register    | Inscription utilisateur    |
| POST    | /auth/login       | Connexion & obtention JWT  |
| GET     | /auth/            | Info utilisateur (JWT req.)|

### Idées (JWT)
| Méthode | Route                         | Description               |
|---------|-------------------------------|---------------------------|
| GET     | /idees                        | Liste des idées           |
| POST    | /ajouter-idee                 | Ajouter une idée (≥ 10 car.) |
| DELETE  | /idees/:id                    | Supprimer une idée        |
| POST    | /idees/:id/evaluation         | Noter une idée (1–5)      |
| POST    | /idees/:id/statut             | Changer statut            |

## Base de données
Fichier SQL : `BoiteAIdees.sql`
- Tables : `evaluations`, `statuts`, `idees`, `utilisateurs`
- Clés et contraintes FK définies en fin de dump

## Contribuer
PR et issues sont les bienvenus. Merci de respecter la convention de commit et d’ouvrir une MR pour toute nouvelle feature.

## License
MIT © 2025
