# Step 1: Build the Next.js app
FROM docker.io/node:alpine as builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) files
COPY ./src/ .
# If you're using Yarn, uncomment the next line and comment out the npm install line
# COPY yarn.lock ./

# Install dependencies
RUN npm install
#RUN npm ci --production
# If you're using Yarn, uncomment the next line and comment out the npm install line
# RUN yarn install

# Build your Next.js app
RUN npm run build
# If you're using Yarn, uncomment the next line and comment out the npm run build line
# RUN yarn build

# Step 2: Run the Next.js app
FROM docker.io/node:alpine

# Set the working directory in the container
WORKDIR /app

# Copy the built app from the previous stage
COPY --from=builder /app/next.config.mjs ./
COPY --from=builder /app/package.json ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules

# Expose the port Next.js runs on
EXPOSE 3000
USER 1000
# Command to run the app
CMD ["npm", "start"]
# If you're using Yarn, uncomment the next line and comment out the npm start line
# CMD ["yarn", "start"]
