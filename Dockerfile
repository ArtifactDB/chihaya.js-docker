FROM ghcr.io/ltla/emcmake-docker/builder:2023-07-17

# Putting Node in the path.
ENV FINALPATH="${PATH}"
ENV PATH="/emsdk/node/16.20.0_64bit/bin:${FINALPATH}"

RUN git clone https://github.com/ArtifactDB/chihaya.js && \
    cd chihaya.js && \
    git checkout master

WORKDIR chihaya.js

# Grabbing the node modules. 
RUN npm i --include=dev

# Revert any NPM-induced changes to these files.
RUN git checkout -- package.json

# Running the builds.
RUN cd wasm && ./build.sh 

# Removing Node from the path.
ENV PATH="${FINALPATH}"
