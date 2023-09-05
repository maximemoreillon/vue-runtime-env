# Build the Vue app
FROM node:16 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

# Copy the compiled app in an NGINX contaier
FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf

# Executing the script at container runtime
COPY substitute_environment_variables.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/substitute_environment_variables.sh
