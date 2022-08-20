FROM debian:buster

WORKDIR "/opt/drawio-and-latex"

ENV DRAWIO_VERSION "16.0.0"

RUN apt-get update && \
    apt-get install -y xvfb wget libappindicator3-1 libgbm1 libasound2 texlive-base texlive-fonts-recommended texlive-fonts-extra texlive-science && \
    wget -q https://github.com/jgraph/drawio-desktop/releases/download/v${DRAWIO_VERSION}/drawio-amd64-${DRAWIO_VERSION}.deb && \
    apt-get install -y /opt/drawio-and-latex/drawio-amd64-${DRAWIO_VERSION}.deb && \
    rm -rf /opt/drawio-and-latex/drawio-amd64-${DRAWIO_VERSION}.deb && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh ./

ENV XVFB_DISPLAY ":42"
ENV XVFB_OPTIONS ""

ENTRYPOINT ["/opt/drawio-and-latex/entrypoint.sh"]