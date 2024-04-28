# Use the official Ruby image as the base image
FROM ruby:3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory inside the container
WORKDIR /book-manager

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /book-manager/ap/Gemfile
COPY Gemfile.lock /book-manager/ap/Gemfile.lock

# Install gems
RUN bundle install

# Copy the main application
COPY . /book-manager

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose port 3000 to the outside world
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
