# Docker Frappe (Multi-container)

Frappe, ERPNext, Schools - Dockerized on Alpine

## Build the containers

1. From the `alpine/frappe` directory run: `make`.
2. From the `alpine/erpnext` directory run: `make`.

## Start a local version of ERPNext

1. First we need to bootstrap the installation, from the `alpine` folder run: `docker-compose run app`.
2. Enter `y` and enter, when asked to reset the database.
3. After this process completes you will need to exit the container (for example: `ctrl+c`). The process completes after you see messages stating: `Booting worker with pid`...
4. `docker-compose up -d`
5. `docker-compose logs -f`

You should be able to log in to the server at `http://localhost`. The username is `Administrator` and the password is `frappe`. Follow the prompts to complete the initial setup.
