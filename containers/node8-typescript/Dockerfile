# docker build -t bryanmacfarlane/poc-node8-typescript .
# docker run -it bryanmacfarlane/poc-node8-typescript bash

# Follow 1801,4,7,10 tag pattern
FROM bryanmacfarlane/poc-debian-dev:1806

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
ENV NODE_VER 8.11.2
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
RUN npm install -g typescript \
    # install globally per: https://bower.io/  (26MB)
    && npm install -g bower
