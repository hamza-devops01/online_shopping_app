#Getting Base Image (OS)
FROM node:24-alpine

#Make Working Dir for Code and req
WORKDIR /app

#COPY Everything from the source (Host) to destination(Container)
COPY . .

#Install the packages/Dependencies
RUN npm ci

#Expose the Port
EXPOSE 5173

#Server the Application
CMD ["npm","run","dev"]
