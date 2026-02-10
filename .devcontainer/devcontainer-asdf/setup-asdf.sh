#!/usr/bin/env bash
set -euo pipefail

function setup_asdf {
    mkdir -p ~/.asdf
    echo '. <(asdf completion bash)' >> ~/.bashrc
}

function setup_asdf_plugin_manager {
    asdf plugin add asdf-plugin-manager https://github.com/asdf-community/asdf-plugin-manager.git;
    # Pin the asdf-plugin-manager version using git tag or even better using git hash which is immutable.
    asdf plugin update asdf-plugin-manager v1.5.0;

    # Install specific version
    asdf install asdf-plugin-manager 1.5.0;

    # Set the plugin version (on your ~/.tool-versions file)
    asdf set asdf-plugin-manager 1.5.0;

    # Now asdf-plugin-manager command is available
    asdf-plugin-manager version;
}

function setup_plugin_versions {

cat << EOF > ~/.plugin-versions
asdf-plugin-manager      https://github.com/asdf-community/asdf-plugin-manager.git	db4a5e6d46ea5b0df8476249536ac89deaddc08c
python                   https://github.com/asdf-community/asdf-python.git .
java                     https://github.com/halcyon/asdf-java.git .
golang                   https://github.com/asdf-community/asdf-golang.git  .
terraform                https://github.com/asdf-community/asdf-hashicorp.git .
nodejs                   https://github.com/asdf-vm/asdf-nodejs.git    .
pnpm                     https://github.com/jonathanmorley/asdf-pnpm .
EOF

}

function setup_tool_versions {

cat > ~/.tool-versions << EOF
asdf-plugin-manager 1.5.0
python 3.14.3
java temurin-21.0.9+10.0.LTS
golang 1.25.7
terraform 1.14.4
nodejs 24.13.0
pnpm 10.28.2
EOF

}

setup_asdf;
setup_plugin_versions;
setup_tool_versions;
setup_asdf_plugin_manager;