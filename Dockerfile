# Usamos una imagen oficial y ligera de Nginx
FROM nginx:alpine

# Copiamos tu archivo HTML a la carpeta pública del servidor
COPY index.html /usr/share/nginx/html/index.html

# Cloud Run usa el puerto 8080 por defecto. 
# Modificamos la configuración de Nginx para que escuche en ese puerto en lugar del 80.
RUN sed -i 's/listen  *80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Exponemos el puerto
EXPOSE 8080

# Iniciamos el servidor
CMD ["nginx", "-g", "daemon off;"]
