#-*- mode: sh -*-
# vi: set ft=sh :

FROM centos-7.2.1511

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

RUN apt-get update && apt-get upgrade -y

RUN groupadd uuu
RUN adduser --home /home/uuu --disabled-password --gecos 'uuu' --ingroup uuu uuu

# ONLY-while-debugging
# askubuntu.com/questions/168280/how-do-i-grant-sudo-privileges-to-an-existing-user
RUN adduser uuu sudo 	#	&& usermod -aG sudo spx
# askubuntu.com/questions/192050/how-to-run-sudo-command-with-no-password
RUN echo "" >> /etc/sudoers && echo '#forcibly add uuu with no passwd' >> /etc/sudoers 	&& echo 'uuu ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir /local 	&& mkdir /local/conf

RUN chown -R uuu:uuu /local


VOLUME ["/uuu"]
RUN chown -R uuu:uuu /home/uuu

#USER uuu 
WORKDIR /home/uuu

