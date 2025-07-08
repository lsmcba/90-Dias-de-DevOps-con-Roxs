#!/bin/bash
set -e

LOG="$(dirname "$0")/logs_despliegue.txt"
touch "$LOG"
echo "Archivo de log inicializado en: $LOG" | tee -a "$LOG"

instalar_dependencias() {
  echo "Instalando dependencias..." | tee -a "$LOG"
  sudo apt update >> "$LOG" 2>&1
  sudo apt install -y python3 python3-pip python3-venv nginx git >> "$LOG" 2>&1
  sudo systemctl enable nginx >> "$LOG" 2>&1
  sudo systemctl start nginx >> "$LOG" 2>&1
}

configurar_entorno() {
  echo "Clonando aplicación y configurando entorno virtual..." | tee -a "$LOG"
  git clone -b booklibrary https://github.com/roxsross/devops-static-web.git >> "$LOG" 2>&1
  cd devops-static-web || { echo "No existe carpeta devops-static-web" | tee -a "$LOG"; exit 1; }
  
  echo "Creando entorno virtual..." | tee -a "$LOG"
  python3 -m venv venv >> "$LOG" 2>&1
  
  echo "Activando entorno..." | tee -a "$LOG"
  source venv/bin/activate
  
  echo "Actualizando pip..." | tee -a "$LOG"
  pip install --upgrade pip >> "$LOG" 2>&1
  
  echo "Instalando requirements.txt..." | tee -a "$LOG"
  pip install -r requirements.txt >> "$LOG" 2>&1
  
  echo "Instalando gunicorn..." | tee -a "$LOG"
  pip install gunicorn >> "$LOG" 2>&1
}

iniciar_gunicorn() {
  echo "Iniciando Gunicorn..." | tee -a "$LOG"
  nohup venv/bin/gunicorn -w 4 -b 127.0.0.1:8000 library_site:app >> "$LOG" 2>&1 &
  sleep 3
}

configurar_nginx() {
  echo "Configurando Nginx..." | tee -a "$LOG"
  sudo rm -f /etc/nginx/sites-enabled/default

  sudo tee /etc/nginx/sites-available/booklibrary > /dev/null <<EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_redirect off;
    }

    location /static/ {
        alias $(pwd)/static/;
        expires 30d;
    }

    access_log /var/log/nginx/booklibrary_access.log;
    error_log /var/log/nginx/booklibrary_error.log;
}
EOF

  sudo ln -sf /etc/nginx/sites-available/booklibrary /etc/nginx/sites-enabled/
  sudo nginx -t >> "$LOG" 2>&1
  sudo systemctl reload nginx >> "$LOG" 2>&1
}

verificar_estado() {
  echo "Verificando servicios..." | tee -a "$LOG"
  systemctl is-active --quiet nginx && echo "✓ Nginx activo" | tee -a "$LOG" || echo "✗ Nginx inactivo" | tee -a "$LOG"
  pgrep -f "gunicorn.*library_site.app" > /dev/null && echo "✓ Gunicorn corriendo" | tee -a "$LOG" || echo "✗ Gunicorn no corriendo" | tee -a "$LOG"
  curl -s http://127.0.0.1:8000 > /dev/null && echo "✓ Gunicorn responde" | tee -a "$LOG" || echo "✗ Gunicorn no responde" | tee -a "$LOG"
}

main() {
  instalar_dependencias
  configurar_entorno
  iniciar_gunicorn
  configurar_nginx
  verificar_estado

  echo "Despliegue completado. Revisa $LOG para más detalles."
  echo "La aplicación debería estar disponible en: http://$(hostname -I | awk '{print $1}')"
}

main
