FROM theyoctojester/devcontainer-base-zephyr:jammy

### Local user ###
# '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
RUN useradd -l -u 1000 -G sudo -md /home/user -s /bin/bash -p user user \
    # passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
ENV HOME=/home/user
WORKDIR $HOME

### Local user (2) ###
USER user
# use sudo so that user does not get sudo usage info on (the first) login
RUN sudo echo "Running 'sudo' for user: success"
