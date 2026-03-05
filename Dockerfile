FROM node:20-alpine
RUN npm install -g coderifts@latest
COPY pipe.sh /
RUN chmod +x /pipe.sh
ENTRYPOINT ["/pipe.sh"]
