server {
    listen 443 ssl;
    server_name turrdohrnii.com www.turrdohrnii.com;

    ssl_certificate /etc/letsencrypt/live/turrdohrnii.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/turrdohrnii.com/privkey.pem;

    root /var/www/turrdohrnii.com;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 80;
    server_name turrdohrnii.com www.turrdohrnii.com;

    return 301 https://$host$request_uri;
}