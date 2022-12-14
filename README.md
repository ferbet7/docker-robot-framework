
# docker-robot-framework

Robot Framework running on docker.


[![Python 3.9](https://img.shields.io/badge/python-3.9-blue.svg)](https://www.python.org/downloads/release/python-390/)

## Features

- Dockerfile ready for Robot Framework testing
- Docker compose to serve the Robot Framework process
- RFM - Data Driven Tests
- RFM - Custom Libraries
- RFM - Page Object Testing Design

Run your tests with docker and forget about configuration!


## Deployment

To deploy this project run

```docker
  docker build -t rfm-testing .
```

And after run

```docker
  docker compose up
```

## License

[MIT](https://choosealicense.com/licenses/mit/)

