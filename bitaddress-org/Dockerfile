FROM nginx:1.15

RUN apt-get update -y && apt-get install wget -y
RUN wget -E -H -k -K -p https://www.bitaddress.org/ || echo "There is some error"
RUN rm /usr/share/nginx/html/index.html
RUN mv -v /www.bitaddress.org/* /usr/share/nginx/html && rm -rf /www.bitaddress.org
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]