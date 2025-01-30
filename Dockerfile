# FROM node:18-alpine
# WORKDIR /app
# COPY . .
# RUN yarn install
# CMD ["node", "index.js"]
# EXPOSE 3000

# Use the official Node.js 18 LTS Alpine image as the base
FROM node:18-alpine

# Set environment variable for the app directory
ENV APP_HOME=/usr/src/app

# Set the working directory inside the container
WORKDIR $APP_HOME

# Copy package.json and yarn.lock (if using yarn) to install dependencies separately for caching purposes
COPY package.json yarn.lock ./

# Install dependencies using Yarn (use npm if preferred)
RUN yarn install

# Copy the rest of the application code into the container
COPY . .

# Expose the application port (3000 in this case)
EXPOSE 3000

# Run the application
CMD ["node", "index.js"]
