FROM eclipse-temurin:17.0.6_10-jre

RUN apt-get update && apt-get install -y dos2unix

COPY install.sh /tmp/install.sh
RUN dos2unix /tmp/install.sh

RUN bash /tmp/install.sh \
    && rm -rf /var/lib/apt/lists/* \
    && rm /tmp/install.sh

COPY run_pmd.sh /opt
COPY run_cpd.sh /opt
COPY ruleset.xml /opt
COPY run_checkstyle.sh /opt

RUN chmod +x /opt/run_pmd.sh /opt/run_cpd.sh /opt/run_checkstyle.sh
