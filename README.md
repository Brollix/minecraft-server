# Minecraft Server en AWS EC2

Servidor de Minecraft Java configurado y desplegado en una instancia EC2 (Ubuntu 22.04) como proyecto técnico.

---

## 🧱 Estructura del Proyecto

```bash
minecraft-server/
├── README.md
├── start.sh
├── eula.txt
└── server.jar
```

---

## ✅ Requisitos

- Cuenta en AWS con acceso a EC2
- Clave SSH (PEM) para conexión
- Instancia EC2 (Ubuntu 22.04)
- Java 17 o superior
- Puerto 25565 abierto (TCP) en el Security Group
- Permitir conexión por SSH o EC2 Instance Connect

---

## ⚙️ Instalación Local

```bash
# Crear carpeta del proyecto
mkdir minecraft-server
cd minecraft-server

# Crear archivos necesarios
echo "eula=true" > eula.txt

# Crear script de arranque
cat <<EOF > start.sh
#!/bin/bash
cd "\$(dirname \"$0\")"
screen -dmS minecraft java -Xms512M -Xmx768M -jar server.jar nogui
EOF
chmod +x start.sh

# Crear README.md (este archivo)
# Descargar el JAR desde el sitio oficial
curl -o server.jar https://launcher.mojang.com/v1/objects/934d9fcfc3d305a122ecfa516ed6c47f02c0d535/server.jar
```

---

## ☁️ Subir a GitHub

```bash
git init
git add .
git commit -m "Initial commit: Minecraft server EC2 project"
git remote add origin https://github.com/Brollix/minecraft-server
git branch -M main
git push -u origin main --force
```

---

## 🔧 Despliegue en AWS EC2

### 1. Conectarse a la instancia

```bash
ssh -i minecraft-key.pem ubuntu@<EC2_PUBLIC_DNS>
```

O desde el navegador con EC2 Instance Connect.

### 2. Clonar el repositorio

```bash
git clone https://github.com/Brollix/minecraft-server.git
cd minecraft-server
```

### 3. Ejecutar el servidor

```bash
chmod +x start.sh
./start.sh
```

### 4. Conectarse desde Minecraft

Ingresar la IP pública de tu instancia EC2:

```text
<EC2_PUBLIC_IP>:25565
```

---

## 💡 Notas Técnicas

- `screen` mantiene el servidor activo tras cerrar la terminal
- `eula.txt` ya acepta los términos automáticamente
- Si usás una instancia `t2.micro`, puede haber lag
- Se recomienda `t3.medium` spot para mejor rendimiento

---

## 💰 Estimación de Costos (junio 2025)

| Instancia EC2    | Tipo       | Precio aprox USD/mes |
|------------------|------------|-----------------------|
| t2.micro (Free)  | Bajo demanda | $0 (Free Tier)       |
| t3.medium (Spot) | Spot         | ~$4–6                |

> Para reducir costos, apagá la instancia cuando no la uses. Considerá backups con S3 si querés persistencia.

---

## 📦 Recursos adicionales

- [Documentación oficial Minecraft server](https://www.minecraft.net/en-us/download/server)
- [Guía AWS EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
- [mcversions.net](https://mcversions.net/) – versiones anteriores del server

---

Proyecto creado por [Brollix](https://github.com/Brollix) como demostración técnica de infraestructura cloud con AWS.
