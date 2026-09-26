# Gunakan base image Nginx Alpine yang sangat ringan (< 25MB)
FROM nginx:alpine

# Bersihkan direktori default Nginx
RUN rm -rf /usr/share/nginx/html/*

# Salin konfigurasi kustom Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Salin file frontend web ke direktori root Nginx
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY app.js /usr/share/nginx/html/

# Pastikan file memiliki permission yang sesuai
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 8080 (port standar default Google Cloud Run)
EXPOSE 8080

# Jalankan Nginx di foreground
CMD ["nginx", "-g", "daemon off;"]
