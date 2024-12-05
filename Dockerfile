# Stage 1: Build Stage
FROM alpine:latest AS builder

# Set working directory
WORKDIR /app

# Copy necessary files into the builder stage
COPY index.html .
COPY style.css .

# Stage 2: Final Stage
FROM nginx:alpine

# Copy the built files from the builder stage to the nginx html directory
COPY --from=builder /app/index.html /usr/share/nginx/html/
COPY --from=builder /app/style.css /usr/share/nginx/html/

# Expose port
EXPOSE 9091

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
