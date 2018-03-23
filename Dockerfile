FROM debian:stretch


# Install update.
RUN apt-get update -y \
 && apt-get install -y

# Install asterisk as IPBX server.
RUN apt install asterisk-prompt-fr-armelle -y

# Empty the current contents of the 3 asterisk configuration files
RUN > /etc/asterisk/sip.conf \
    > /etc/asterisk/extensions.conf \
    > /etc/asterisk/voicemail.conf

# Add configuration to image
COPY /conf/sipconf /etc/asterisk/sip.conf
COPY /conf/extensions /etc/asterisk/extensions.conf
COPY /conf/voicemail /etc/asterisk/voicemail.conf

ENTRYPOINT 'bash'
