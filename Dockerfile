FROM atlassian/pipelines-awscli:1.16.98

COPY pipe /usr/bin/

ENTRYPOINT ["/usr/bin/pipe.sh"]
