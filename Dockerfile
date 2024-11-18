#Stage 1 - Install dependencies and build the app
FROM registry.gitlab.com/denk-doch-digital/devops/flutter-docker/main:latest AS build-env

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Copy files to container and build
RUN mkdir -p /app/flutter-app
COPY . /app/flutter-app
WORKDIR /app/flutter-app
RUN mv flutter-app-shared /app
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx
ADD default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-env /app/flutter-app/build/web /usr/share/nginx/html
