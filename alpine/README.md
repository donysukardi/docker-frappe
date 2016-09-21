# Docker Frappe (Multi-container)

Frappe, ERPNext, Schools - Dockerized on Alpine

Follow the steps below to run your own local installation of ERPNext.

## Build the containers

1. Start from the `apline` directory.
2. Run: `IMAGE_NAME=donysukardi/frappe:stable ./hooks/build`.
3. Run: `IMAGE_NAME=donysukardi/erpnext:stable ./hooks/build`.

## Start a local version of ERPNext

1. First we need to bootstrap the installation, from the `alpine` folder run: `docker-compose run app`.
2. Enter `y` and enter, when asked to reset the database.
3. After this process completes you will need to exit the container (for example: `ctrl+c`). The process completes after you see messages stating: `Booting worker with pid`...
4. Start the containers: `docker-compose up -d`.
5. Watch the container logs: `docker-compose logs -f`.

You should be able to log in to the server at `http://localhost`. The username is `Administrator` and the password is `frappe`. Follow the prompts to complete the initial setup.
