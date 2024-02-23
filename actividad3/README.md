# Actividad 3 
---
---
# Pasos a realizar para ejecutar el programa en un Sistema Linux
---

### Crear Script

1. Abrir la terminal.
2. Navegar a la carpeta donde se albergará el archivo.
3. ejecutar 
```bash
vim nombre_archivo.sh
```
4. Escribir el código.
5. Guardar el archivo.
6. Dar permisos de ejecución al archivo.
```bash
chmod +x nombre_archivo.sh
```
---
### Crear Servicio

1. Abrir la terminal.
2. Navegar a system.
```bash
cd /etc/systemd/system
```
3. Crear un archivo con extensión .service
```bash
sudo vim nombre_servicio.service
```
4. Escribir el código.
5. Guardar el archivo.
---   
### Iniciar Servicio

1. Abrir la terminal.
2. Habilitar el servicio.
```bash
sudo sudo systemctl start nombre_servicio.service
```
3. Verificar el estado del servicio.
```bash
sudo systemctl status nombre_servicio.service
```
---
### Instalar servicio en Startup
    
```bash
sudo systemctl enable nombre_servicio.service
```
---
### Verificar el Log

```bash
journalctl -u nombre_servicio.service -f
```

Opción 1: 
```bash
journalctl -u nombre_servicio.service
```
Opción 2:
```bash
sudo systemctl status nombre_servicio.service
```
Opción 3:
```bash
tail /var/log/syslog
```

---
---

### Detener el Servicio

```bash
sudo systemctl stop nombre_servicio.service
```

### Desinstalar servicio en Startup

```bash
sudo systemctl disable nombre_servicio.service
```
