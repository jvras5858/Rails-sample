FROM ruby:3.1-bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libyaml-dev pkg-config \
    libsqlite3-dev libpq-dev \
    libvips shared-mime-info tzdata \
    git curl zsh bash openssh-client unzip \
    && rm -rf /var/lib/apt/lists/*


RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y

RUN gem install bundler:2.5.10 && gem install rails -v "~> 7.2"

RUN useradd -ms /bin/zsh dev
COPY .zshrc /home/dev/
RUN chown -R dev:dev /usr/local/bundle
USER dev

ENV PATH="/home/dev/.local/bin:${PATH}"
ENV ZSH_THEME=starship
ENV HATSTALL_ENV=dev

ENV GEM_HOME=/home/dev/.gems
ENV GEM_PATH=/home/dev/.gems
ENV PATH="/home/dev/.gems/bin:/home/dev/.local/bin:${PATH}"

RUN gem install ruby-lsp


SHELL ["/bin/zsh", "-c"]

WORKDIR /workspace


CMD ["tail", "-f", "/dev/null"]
