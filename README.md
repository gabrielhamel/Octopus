# Ansible

## 🏡 **Comment simuler un environement :**

### 📦 Dépendances:
- **virtualbox** (6+)
- **vagrant** (2.2+)

```bash
./setup_env.sh
```

### ☕ Prendre un café

## **🎯 Déployer :**

### 📦 Dépendances:
- **ansible** (2.7+)

```bash
# Create a file with the database password
echo thesecretpassword > /tmp/.vault_pass
# Setup the ansible vault var
export ANSIBLE_VAULT_PASSWORD_FILE=/tmp/.vault_pass
# Launch deployment
ansible-playbook -i production playbook.yml
```
### ☕ Reprendre un café

## **⚽ Utilisation :**
- [Page formulaire](http://localhost:5000)
- [Page résulats](http://localhost:5001)

## **🛑 Arrêter l'environement :**
```bash
vagrant halt
```

## **🗑️ Détruire l'environement :**
```bash
vagrant destroy -f
```
