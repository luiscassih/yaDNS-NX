FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN set -x \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y bind9
COPY named.conf.local /etc/bind/named.conf.local
COPY net.nintendo.zone /etc/bind/zones/net.nintendo.zone
COPY net.nintendowifi.zone /etc/bind/zones/net.nintendowifi.zone
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
EXPOSE 53
EXPOSE 53/udp
EXPOSE 80/tcp
EXPOSE 80/udp
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]