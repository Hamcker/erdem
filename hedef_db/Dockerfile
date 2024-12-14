# Use the official MariaDB image from the Docker Hub
FROM mariadb:10.3

# Remove the environment variables for MariaDB
# ENV MYSQL_ROOT_PASSWORD=rootpassword
# ENV MYSQL_DATABASE=TestDB
# ENV MYSQL_USER=myuser
# ENV MYSQL_PASSWORD=mypassword

# Copy the SQL file to the Docker container
COPY ./init.sql /docker-entrypoint-initdb.d/

# Expose the default MariaDB port
EXPOSE 3306

# The MariaDB image automatically runs any scripts in /docker-entrypoint-initdb.d/
# when the container is first started, so no additional commands are needed.
