# trunk-ignore-all(checkov/CKV_DOCKER_2)
ARG __base_image=ubuntu:24.04
# trunk-ignore(checkov/CKV_DOCKER_7,hadolint/DL3006)
FROM ${__base_image}

ARG __hcledit_ver=0.2.17
ARG __hcledit_download_url=https://github.com/minamijoyo/hcledit/releases/download/v${__hcledit_ver}/hcledit_${__hcledit_ver}_linux_amd64.tar.gz

# trunk-ignore(hadolint/DL3008,hadolint/DL4006)
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qy update \
    && apt-get -qy install --no-install-recommends \
        ca-certificates \
        curl \
    && curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
    && curl -sL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get -qy update && apt-get -qy install --no-install-recommends terraform \
    && curl -sL ${__hcledit_download_url} | tar -zxv \
    && mv hcledit /usr/local/bin \
    && curl https://get.trunk.io -fsSL | bash \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG __GID=801
ARG __GNAME=vscode
ARG __UID=801
ARG __UNAME=vscode
ARG __UHOME=/home/${__UNAME}
ARG __WORKSPACE_FOLDER=/workspace
    
RUN groupadd -g ${__GID} ${__GNAME} \
    && useradd -l -rm -d ${__UHOME} -s /bin/bash -g ${__GID} -u ${__UID} ${__UNAME} \
    && mkdir -p ${__WORKSPACE_FOLDER} \
    && chown ${__UNAME}:${__GNAME} ${__WORKSPACE_FOLDER} \
    && git config --global --add safe.directory "${__WORKSPACE_FOLDER}" \
    && chown -R ${__UNAME}:${__GNAME} /usr/local/bin

# Note last command to force trunk to work, otherwise it goes in permission denied error

USER ${__UNAME}

RUN git config --global --add safe.directory "${__WORKSPACE_FOLDER}"