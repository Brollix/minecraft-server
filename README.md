# Minecraft Server en AWS EC2

Servidor de Minecraft Java configurado en EC2 (Ubuntu 22.04) como proyecto técnico.

## Requisitos
- Instancia EC2 (Ubuntu 22.04)
- Java 21 o compatible
- Puerto 25565 abierto en el Security Group
- Permitir SSH o EC2 Instance Connect

## Instalación
```bash
git clone https://github.com/tu-usuario/minecraft-server.git
cd minecraft-server
chmod +x start.sh
