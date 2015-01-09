FROM debian

# Substitute your upstream container as the FROM

MAINTAINER Andrew Zenk <andrew@andrewzenk.com>

COPY config_template_processor.sh /bin/config_template_processor.sh
COPY config_manifest /etc/config_manifest
# Add copy commands for any config files.  This could be scripted from the
# config_manifest eventually

ENTRYPOINT ["/bin/config_template_processor.sh", "/etc/config_manifest"]
# Add a CMD entry for running the actual app
