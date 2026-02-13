FROM mcr.microsoft.com/devcontainers/go:trixie

ARG USERNAME=vscode
ARG USER_UID=1001
ARG USER_GID=1001

RUN groupmod --gid ${USER_GID} ${USERNAME} \
    && usermod --uid ${USER_UID} --gid ${USER_GID} ${USERNAME} \
    && chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}

ENV ASDF_DIR=/home/${USERNAME}/.asdf
ENV ASDF_DATA_DIR=/home/${USERNAME}/.asdf
ENV ASDF_PLUGIN_MANAGER_ADD_CLEAN=TRUE
ENV PATH=/home/${USERNAME}/.asdf/shims:/home/${USERNAME}/go/bin:${PATH}

COPY --chown=${USERNAME}:${USERNAME} setup-asdf.sh /usr/local/bin/setup-asdf.sh
RUN chmod +x /usr/local/bin/setup-asdf.sh

USER ${USERNAME}
RUN mkdir -p ${ASDF_DIR}
RUN go install github.com/asdf-vm/asdf/cmd/asdf@v0.18.0
RUN /usr/local/bin/setup-asdf.sh
