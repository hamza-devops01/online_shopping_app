#Getting Base Image (OS)
FROM node:20-alpine as build

#Make Working Dir for Code and req
WORKDIR /app

#Copy only package &package-lock.json so it store in cache
COPY package*.json ./

#Install dependencies

RUN npm install


#Copy reaming code
COPY . .

#We collect the css & static files in one place and serve with nginx
RUN npm run build

# Production stage with Nginx

#Use image of nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

#Expose the Port
EXPOSE 80

#Server the Applicatioin
CMD ["nginx", "-g", "daemon off;"]
