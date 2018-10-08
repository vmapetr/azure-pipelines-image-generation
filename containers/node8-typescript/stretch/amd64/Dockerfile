# docker build -t bryanmacfarlane/poc-node8-typescript .
# docker run -it bryanmacfarlane/poc-node8-typescript bash

# Follow 1801,4,7,10 tag pattern
FROM base/stretch

#------------------------------------------------------------------
# AZURE CLI
#------------------------------------------------------------------
# RUN curl -L https://packages.microsoft.com/keys/microsoft.asc

# #~300MB
# # Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
# RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" \
#   | sudo tee /etc/apt/sources.list.d/azure-cli.list

# RUN cat /etc/apt/sources.list.d/azure-cli.list
# RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - \
#  && apt-get update \
#  && apt-get install -y --no-install-recommends \
#  #  apt-transport-https \
#     azure-cli \
#  && rm -rf /var/lib/apt/lists/*

#------------------------------------------------------------------
# NODE / NPM
#------------------------------------------------------------------
ENV NODE_VER 8.12.0
ENV NODE_PATH /usr/local/bin/node-v${NODE_VER}/bin
RUN mkdir -p ${NODE_PATH}
RUN curl -fsSLO https://nodejs.org/download/release/v${NODE_VER}/node-v${NODE_VER}-linux-x64.tar.gz \
    && tar --strip-components=1 -xvzf node-v${NODE_VER}-linux-x64.tar.gz -C /usr/local/bin/node-v${NODE_VER}
RUN rm node-v${NODE_VER}-linux-x64.tar.gz
ENV PATH ${NODE_PATH}:$PATH

#------------------------------------------------------------------
# NODE Tools
#------------------------------------------------------------------
# 45 MB
# RUN npm install -g npm \
#     # install globally per: https://bower.io/  (26MB)
#     && npm install -g typescript \
#     && npm install -g grunt \
#     && npm install -g gulp \
#     && npm install -g parcel-bundler \
#     && npm install -g webpack webpack-cli \
#     && npm install -g parcel-bundler
RUN npm install -g npm \
    && npm install -g typescript

# Install Yarn repository and key
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends yarn \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/apt/sources.list.d/*
