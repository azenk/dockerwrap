## Usage
* Set FROM in Dockerfile to a container that doesn't use environment variables for configuration
* Add COPY entries to the Dockerfile for all of your files
* Edit config_manifest to include absolute paths to all config files that should be processed
* Edit allowed_variables to list all variables that you'd like to support
* Add a CMD Entry to the bottom of the file that matches the parent container
